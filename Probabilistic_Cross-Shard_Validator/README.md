# Probabilistic Cross-Shard Validator

This project models how validator overlap across shards affects the probability of shard compromise in a distributed validation system. Using Monte Carlo simulation, it evaluates how different assignment strategies, adversarial behaviors, and overlap rates trade off against security and system overhead.

## Objective

To quantify the relationship between validator overlap, attack probability, and communication overhead in a sharded validation network, and to assess which assignment patterns reduce the risk of a malicious coalition taking control of a shard.

## Skills Demonstrated

- Python programming and simulation design
- Probabilistic modeling and Monte Carlo analysis
- Distributed systems and sharding concepts
- Security risk assessment for validator networks
- Statistical evaluation of compromise scenarios
- Data visualization with Matplotlib
- Experimental analysis of adversarial behavior

## Workflow

1. Define a validator population and shard assignment model
2. Simulate attacker presence and validator overlap across shards
3. Evaluate compromise probability under different overlap rates
4. Measure the associated overhead of cross-shard validation
5. Compare baseline, adversarial, and defense-reactive scenarios
6. Visualize security vs. overhead tradeoffs
7. Interpret the threshold behavior and model implications

## Tools Used

- Python
- NumPy
- Matplotlib
- Jupyter Notebook
- Monte Carlo simulation
- Probability and statistical analysis

## Outputs

- Simulation results comparing overlap probability and compromise risk
- Plots of security vs. overhead tradeoffs
- Scenario-based analysis of adversarial and defensive behaviors
- Notebook-based summary of model assumptions and findings

## Repository Files

- `project_code.ipynb` – main simulation notebook with experiments, plots, and scenario testing
- `Probabilistic_Cross_Shard_Validator.pdf` – summary report describing the model and results
