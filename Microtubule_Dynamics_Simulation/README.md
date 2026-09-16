# Microtubule Dynamics Simulation

This project simulates microtubule assembly using a stochastic lattice model to study how GTP/GDP state, neighbor interactions, and hydrolysis regulate protofilament growth and instability.

## Objective

To model microtubule assembly and disassembly dynamics using a simplified stochastic framework and evaluate how local biochemical rules drive growth behavior over time.

## Skills Demonstrated

- Python programming and numerical modeling
- Stochastic simulation and Gillespie algorithm implementation
- Lattice-based biophysical modeling
- Time-series analysis of growth trajectories
- Scientific visualization with Matplotlib
- Biological interpretation of polymer dynamics
- Computational modeling of dynamic instability

## Workflow

1. Define a lattice-based representation of microtubule protofilaments
2. Initialize tubulin subunits and track column heights
3. Model attachment and detachment events at available lattice sites
4. Incorporate GTP and GDP states with neighbor-dependent stability rules
5. Apply hydrolysis transitions from GTP to GDP
6. Use stochastic reaction propensities to simulate event timing
7. Update lattice states and track protofilament growth over time
8. Convert simulation output to length trajectories and generate plots
9. Interpret how growth, destabilization, and hydrolysis interact

## Tools Used

- Python
- NumPy
- Matplotlib
- Jupyter Notebook
- Stochastic modeling / Gillespie simulation

## Outputs

- Simulated microtubule growth trajectories
- Time-dependent protofilament length data
- Visualizations of assembly dynamics over simulated time
- Notebook-based summary of the computational model

## Repository Files

- `Microtubule_Assembly.ipynb` – main simulation and visualization notebook
- `Microtubule_Assembly_Stochastic_Model.pdf` – written model overview and summary
