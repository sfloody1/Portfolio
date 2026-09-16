#!/usr/bin/env bash
set -euo pipefail

OUTDIR="south_america_files/Colombia"
mkdir -p "$OUTDIR"

URLS=(
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251159/ERR251159_1.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR062/SRR062668/SRR062668_2.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR768/SRR768278/SRR768278_1.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR769/SRR769453/SRR769453_2.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR710/SRR710109/SRR710109_1.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251170/ERR251170_2.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR068/SRR068144/SRR068144_1.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR068/SRR068154/SRR068154_1.fastq.gz"
"ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR063/SRR063092/SRR063092_2.fastq.gz"
)

for URL in "${URLS[@]}"; do
    FILENAME=$(basename "$URL")
    FILEPATH="${OUTDIR}/${FILENAME}"
    FASTQ="${FILEPATH%.gz}"

    echo ">>> Processing $FILENAME"

    # Skip download if .fastq.gz already exists
    if [[ -f "$FILEPATH" ]]; then
        echo "    - Compressed file exists, skipping download."
    else
        echo "    - Downloading..."
        wget -c "$URL" -P "$OUTDIR"
    fi

    # Skip unzip if .fastq already exists
    if [[ -f "$FASTQ" ]]; then
        echo "    - Uncompressed FASTQ exists, skipping gunzip."
    else
        echo "    - Unzipping..."
        gunzip -k "$FILEPATH"
    fi

    echo
done

echo ">>> All files processed."

