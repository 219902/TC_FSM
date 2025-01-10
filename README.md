
# FSM finding overlapping-sequence 010 or 1001

## Mealy
### Graph
![FSM graph](./blueprints/mealy_fsm_task.svg)
### Truth table and state and output equations
![truth table](./blueprints/mealy_truth_table.png)
### K-Maps
#### Output
![truth table](./blueprints/mealy_Z.png)
#### Z<sub>0</sub><sup>n+1</sup>
![truth table](./blueprints/mealy_Z_0.png)
#### Z<sub>1</sub><sup>n+1</sup>
![truth table](./blueprints/mealy_Z_1.png)
#### Z<sub>2</sub><sup>n+1</sup>
![truth table](./blueprints/mealy_Z_2.png)
### Circuits
#### D FFs based
![truth table](./blueprints/mealy_circuit.png)
#### JK FFs based
![truth table](./blueprints/mealy_JK-circuit.png)
#### NAND based
![truth table](./blueprints/mealy_NAND-circuit.png)

## Moore
### Graph
![FSM graph](./blueprints/fsm_task.svg)
### Truth table and state and output equations
![truth table](./blueprints/truth_table.png)
### K-Maps
#### Output
![truth table](./blueprints/Z.png)
#### Z<sub>0</sub><sup>n+1</sup>
![truth table](./blueprints/Z_0.png)
#### Z<sub>1</sub><sup>n+1</sup>
![truth table](./blueprints/Z_1.png)
#### Z<sub>2</sub><sup>n+1</sup>
![truth table](./blueprints/Z_2_v1.png)
![truth table](./blueprints/Z_2_v2.png)
### Circuits
#### D FFs based
![truth table](./blueprints/circuit.png)
#### JK FFs based
![truth table](./blueprints/JK-circuit.png)
#### NAND based
![truth table](./blueprints/NAND-circuit.png)