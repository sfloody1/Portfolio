#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob   # prevent literal *.fastq when none exist

Regions=(
    "western_northern_africa"
    "eastern_central_southern_africa"
    "eastern_asia"
    "western_europe"
    "south_america"
)

western_northern_africa=("Nigeria" "Sierra_Leone" "Gambia")
eastern_central_southern_africa=("Kenya")
eastern_asia=("China" "Japan")
western_europe=("Italy" "UK")
south_america=("Colombia")

Colombia=(
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251159/ERR251159_1.fastq.gz"
)

for Region in "${Regions[@]}"; do
    echo "Starting $Region"

    eval "Countries=(\"\${${Region}[@]}\")"

    for Country in "${Countries[@]}"; do
        echo "Starting $Country"

        FILEDIR="${Region}_files/${Country}"
        mkdir -p "$FILEDIR"

        if ! declare -p "$Country" &>/dev/null; then
            echo "    - No URL list found for $Country, skipping."
            continue
        fi

        eval "URLs=(\"\${${Country}[@]}\")"

        for URL in "${URLs[@]}"; do
            FILENAME=$(basename "$URL")
            FILEPATH="${FILEDIR}/${FILENAME}"
            FASTQ="${FILEPATH%.gz}"

            echo ">>> Processing $FILENAME"

            if [[ -f "$FILEPATH" ]]; then
                echo "    - Compressed file exists, skipping download."
            else
                echo "    - Downloading..."
                wget -c "$URL" -P "$FILEDIR"
            fi

            if [[ -f "$FASTQ" ]]; then
                echo "    - Uncompressed FASTQ exists, skipping gunzip."
            else
                echo "    - Unzipping..."
                gunzip -k "$FILEPATH"
            fi

            if [[ -f "$FASTQ" ]]; then
                echo "    - Removing compressed file..."
                rm -f "$FILEPATH"
            else
                echo "    - WARNING: FASTQ missing after unzip, not deleting $FILEPATH"
            fi

            echo
        done

        REF="BRCA1.fa"
        INDEX_PREFIX="BRCA1"
        OUTDIR="${Region}_output/${Country}"
        TOTAL_OUT="${Region}_output"
        HET_DIR="${OUTDIR}/het_tables"
        SUMMARY="${OUTDIR}/het_counts_summary.txt"
        TOTAL_SUMMARY="${TOTAL_OUT}/het_counts_summary.txt"

        mkdir -p "${OUTDIR}"
        mkdir -p "${HET_DIR}"

        echo -e "Sample\tHeterozygous_Count" > "${SUMMARY}"

        if [ ! -e "${INDEX_PREFIX}.1.bt2" ]; then
            echo ">>> Building Bowtie2 index..."
            bowtie2-build "${REF}" "${INDEX_PREFIX}"
        else
            echo ">>> Bowtie2 index already exists — skipping."
        fi

        echo ">>> Starting batch processing..."
        for READS in "${FILEDIR}"/*.fastq; do

            [ -e "$READS" ] || { echo "No .fastq files found."; exit 1; }

            SAMPLE=$(basename "$READS" .fastq)

            if [[ -f "${HET_DIR}/${SAMPLE}.het.tsv" ]]; then
                echo "    - ${SAMPLE} already analyzed — skipping."
                continue
            fi

            echo "=============================="
            echo ">>> Processing sample: $SAMPLE"
            echo "=============================="

            bowtie2 -x "${INDEX_PREFIX}" -U "${READS}" -S "${OUTDIR}/${SAMPLE}.sam"
            samtools sort "${OUTDIR}/${SAMPLE}.sam" -o "${OUTDIR}/${SAMPLE}.bam"
            samtools flagstat "${OUTDIR}/${SAMPLE}.bam" > "${OUTDIR}/${SAMPLE}.flagstat"
            freebayes -f "${REF}" "${OUTDIR}/${SAMPLE}.bam" > "${OUTDIR}/${SAMPLE}.vcf"
            bcftools norm -f "${REF}" "${OUTDIR}/${SAMPLE}.vcf" > "${OUTDIR}/${SAMPLE}.norm.vcf"
            bcftools view -i 'QUAL>=30' "${OUTDIR}/${SAMPLE}.norm.vcf" | bgzip -c > "${OUTDIR}/${SAMPLE}.filtered.vcf.gz"
            bcftools index "${OUTDIR}/${SAMPLE}.filtered.vcf.gz"
            bcftools view -i 'GT="0/1" || GT="0|1" || GT="1|0"' "${OUTDIR}/${SAMPLE}.filtered.vcf.gz" > "${OUTDIR}/${SAMPLE}.het.vcf"
            bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\t[%GT]\n' "${OUTDIR}/${SAMPLE}.het.vcf" > "${HET_DIR}/${SAMPLE}.het.tsv"

            COUNT=$(wc -l < "${HET_DIR}/${SAMPLE}.het.tsv")
            echo ">>> ${SAMPLE}: ${COUNT} het variants"
            echo -e "${SAMPLE}\t${COUNT}" >> "${SUMMARY}"
            echo -e "${SAMPLE}\t${COUNT}" >> "${TOTAL_SUMMARY}"

            echo ">>> Cleaning up intermediate files..."

            rm -f "$READS"
            rm -f "${OUTDIR}/${SAMPLE}.sam"
            rm -f "${OUTDIR}/${SAMPLE}.bam"
        done

        echo ">>> Batch pipeline completed!"
        echo ">>> Summary file: ${SUMMARY}"
        echo ">>> HET tables saved to: ${HET_DIR}"

    done
done

echo ">>> All files processed."
