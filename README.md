# FPGA-Based Elevator Controller

## Introduction  
This repository contains the implementation of an **Elevator Controller System** using an FPGA. The project uses HDL (Hardware Description Language) for logic design and includes:  
- Source code for controlling elevator operations.  
- Constraints file for GPIO pin mappings.  

This project demonstrates how to design and simulate an elevator system with multiple floors, safety mechanisms on a 7-segment display.

---

## Project Overview  

### Features  
- **Floor Selection:**  
  Button inputs determine the target floor for the elevator.  
- **Motor Control:**  
  Handles movement between floors with precise timing and stopping mechanisms.
- **7-segment Display:**  
  Displays the current number found in the current floor. 
- **Safety Features:**  
  Includes logic to prevent door opening during movement and handles emergency stops.  

### Files in Repository  
- **Source Code (`elevator_controller.v`):**  
  Implements the elevator's logic, including state machines for floor selection and movement.  
- **Constraint File (`elevator_controller.xdc`):**  
  Maps FPGA pins to external hardware like buttons, LEDs, and motor drivers.  

---

## Prerequisites  
- **Software:**  
  - Vivado 2018.3 or compatible versions  
  - Simulation tools (optional)  
- **Hardware:**  
  - FPGA board (e.g., Nexys 7 or similar)  
  - Push buttons for floor selection  
  - 7-Segment Display on Board

---

## How to Use  

### Clone the Repository  
```bash
git clone https://github.com/emrizo88/FPGA-Based-Elevator-Controller-Using-MicroBlaze
cd FPGA-Based-Elevator-Controller-Using-MicroBlaze
