# Portfolio

This repository contains a collection of research-driven computational projects spanning bioinformatics, biophysics, probabilistic modeling, and systems analysis. The work reflects a cross-disciplinary interest in how quantitative methods can be applied to biological questions and to complex technical systems.

## Overview

Across these projects, I explore:

- genomic and transcriptomic analysis in cancer biology
- stochastic and mechanistic modeling of molecular systems
- probabilistic reasoning and simulation-based evaluation
- scientific communication through analysis reports and reproducible notebooks

The portfolio is intentionally diverse: some projects are deeply rooted in biology, while others apply similar analytical thinking to distributed systems and validation models. That breadth is part of the value of the collection—it shows both domain-specific depth and a broader computational mindset.

## Project Highlights

### 1. BRCA1 Analysis

Focus: Variant analysis in BRCA1 using public sequencing data

This project examines population-level BRCA1 variant patterns from public SRA datasets, with emphasis on heterozygous variant discovery and summary across samples and regions. It demonstrates:

- command-line bioinformatics workflows
- Bash automation and reproducible pipelines
- read alignment and variant calling
- VCF filtering and genomic interpretation

Relevant files:

- `BRCA1_Analysis/total_pipeline.sh`
- `BRCA1_Analysis/get_files.sh`
- `BRCA1_Analysis/BRCA1_analysis.pdf`

### 2. Microtubule Dynamics Simulation

Focus: Stochastic modeling of microtubule assembly and instability

This project models microtubule growth using a stochastic lattice framework, capturing how GTP/GDP states, neighbor interactions, and hydrolysis influence protofilament behavior. It demonstrates:

- probabilistic and stochastic modeling
- numerical simulation and algorithm design
- biological interpretation of dynamic systems
- scientific visualization and report writing

Relevant files:

- `Microtubule_Dynamics_Simulation/Microtubule_Assembly.ipynb`
- `Microtubule_Dynamics_Simulation/Microtubule_Assembly_Stochastic_Model.pdf`

### 3. Probabilistic Cross-Shard Validator

Focus: Simulation of validator overlap and shard compromise risk

This project is a little different from the biological work in the portfolio, but it is a strong example of simulation-based systems reasoning. It models how validator overlap across shards affects compromise probability, communication overhead, and the tradeoff between security and efficiency in a distributed validation network.

It is useful as a portfolio project because it shows:

- probabilistic modeling and Monte Carlo analysis
- reasoning about distributed systems and sharding
- security-risk tradeoff analysis
- data-driven experimentation and visualization

This project sits outside the biological core of the portfolio, but it complements it well by illustrating a more systems-oriented, quantitative problem-solving style.

Relevant files:

- `Probabilistic_Cross-Shard_Validator/project_code.ipynb`
- `Probabilistic_Cross-Shard_Validator/Probabilistic_Cross_Shard_Validator.pdf`

### 4. T1R Binding Mechanism

Focus: Protein-ligand interaction analysis in sensory receptor biology

This project explores the structural and mechanistic basis of T1R receptor binding, integrating computational analysis and biological interpretation. It highlights:

- molecular interaction analysis
- data-driven biological modeling
- scientific notebook-based exploration
- communication of mechanistic hypotheses

Relevant files:

- `T1R_Binding_Mechanism/project.ipynb`
- `T1R_Binding_Mechanism/T1R_proteins.pdf`

## Skills Represented

This portfolio reflects experience in:

- Python and Jupyter workflows
- Bash and shell scripting for reproducible pipelines
- statistical and probabilistic analysis
- stochastic simulation and Monte Carlo methods
- bioinformatics and genomic data processing
- scientific writing, visualization, and research reporting
- computational modeling across biological and systems domains

## Why This Portfolio Works

The projects collectively demonstrate a consistent pattern: I like translating messy real-world systems into tractable computational models, then testing, visualizing, and interpreting the results. Some projects are more biologically grounded, while others are more abstract and systems-focused, but they all rely on the same core habits of mind:

- rigor
- experimentation
- quantitative reasoning
- reproducibility
- clear communication of results

## Final Note

The probabilistic cross-shard validator may seem distinct from the rest of the portfolio, but it is actually a good fit: it shows that the same analytical instincts used in biology can also be applied to distributed systems, security design, and simulation-based decision making. It adds breadth without compromising depth.

This collection is best read as a portfolio of computational research and modeling work: grounded in biology, but not limited to it.
