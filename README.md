# Aggregate Production Planning Optimization

## Project Overview
This project presents a deterministic aggregate production planning model for a single product manufacturing facility over a six month horizon. The model minimizes total operational costs by optimizing regular production, overtime production, inventory levels, and workforce adjustments.

## Key Objectives
* Meet forecasted customer demand precisely without allowing backorders or lost sales.
* Minimize the combined costs of regular manufacturing, overtime manufacturing, inventory holding, hiring, and firing.
* Maintain a stable workforce while adhering to capacity limits and end of period inventory requirements.

## Methodology
The problem is formulated as a Mixed Integer Programming model and solved using the GAMS optimization modeling system with the CPLEX solver. Demand forecasts are treated as deterministic inputs based on historical sales data smoothed via linear trend methods.

## System Parameters and Constraints
* The planning horizon spans six months with specific demand targets for each period.
* Regular production capacity is limited to 100 units per worker.
* Overtime production capacity is limited to 20 units per worker.
* The starting workforce is 10 employees with an initial inventory of 200 units.
* A minimum ending inventory of 150 units is strictly enforced at the end of the sixth month.
* Cost parameters include 50 for regular production, 70 for overtime, 5 for inventory holding, 1200 for hiring, and 1800 for firing per unit or worker.

## Optimization Results
* The CPLEX solver achieved a globally optimal solution with a total minimized cost of 309450.
* Overtime production was entirely avoided due to its higher relative cost.
* The workforce was stabilized by hiring exactly one employee in the second period and maintaining a constant staff size of 11 workers for the remainder of the planning horizon.
* Inventory was kept at zero during early periods and built up strictly to satisfy demand peaks and the final period inventory requirement.

## Repository Structure
* src/aggregate_production_planning.gms: The core GAMS model file containing the mathematical formulation and parameters.
* docs/Aggregate_Production_Planning_Report.pdf: The detailed project report covering the problem definition and strategic evaluation.
* logs/cplex_execution.log: The solver execution log detailing the CPLEX optimization process.

## Author
Mustafa Cesmeli
Industrial Engineer
LinkedIn: https://www.linkedin.com/in/mustafacesmeli/
Email: cesmelimustafa0@gmail.com
