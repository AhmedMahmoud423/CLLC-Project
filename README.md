# Bidirectional CLLC Resonant Converter for EV Charging - Graduation Project

![MATLAB](https://img.shields.io/badge/MATLAB-R2022a-orange.svg?style=for-the-badge&logo=mathworks)
![Simulink](https://img.shields.io/badge/Simulink-Required-blue.svg?style=for-the-badge&logo=mathworks)

This repository contains the MATLAB & Simulink files for the design, simulation, and analysis of a bidirectional CLLC resonant converter. This work is submitted as part of the graduation project for the Bachelor of Science in Electrical Engineering at Alexandria University.

---

## 📋 Table of Contents

- [Abstract](#-abstract)
- [Key Features](#-key-features)
- [Converter Topology](#-converter-topology)
- [Repository Structure](#-repository-structure)
- [Prerequisites](#-prerequisites)
- [How to Run the Simulation](#-how-to-run-the-simulation)
- [Simulation Parameters](#-simulation-parameters)
- [Expected Results](#-expected-results)
- [Project Team](#-project-team)
- [Supervisor](#-supervisor)

---

## 📜 Abstract

This project focuses on the design and simulation of a high-efficiency, high-power-density bidirectional DC-DC converter based on the CLLC resonant topology. The converter is designed to operate at a resonant frequency of [Your Frequency, e.g., 100 kHz] with an input voltage of [e.g., 400V] and an output voltage of [e.g., 48V], capable of delivering [e.g., 3 kW] of power in both directions. The primary objective is to achieve Zero Voltage Switching (ZVS) for the primary switches and Zero Current Switching (ZCS) for the secondary rectifier diodes/switches to minimize switching losses. This repository includes the complete Simulink model, parameter calculation scripts, and performance analysis tools.

---

## ✨ Key Features

-   **Bidirectional Power Flow:** Capable of operating in both buck (forward) and boost (backward) modes.
-   **Soft Switching:** Achieves ZVS for primary MOSFETs across a wide load range, significantly improving efficiency.
-   **High Efficiency:** Detailed loss analysis and component selection targeting >[e.g., 97%] peak efficiency.
-   **Parametric Design:** MATLAB scripts are provided to calculate all resonant tank components ($L_r, C_r, L_m, C_{in}, C_{out}$) based on design specifications.
-   **Control System:** Implemented a frequency modulation control scheme to regulate the output voltage.

---

## ⚡ Converter Topology

The circuit is a symmetric full-bridge CLLC resonant converter. It consists of a full-bridge inverter on the primary side, a resonant tank composed of two resonant inductors ($L_r$) and two resonant capacitors ($C_r$), a magnetizing inductance ($L_m$), and a high-frequency transformer. The secondary side employs a synchronous rectifier for efficient bidirectional operation.

*(Optional: You can add a schematic image of your converter here. Just upload the image to your repository and link to it like this: `![CLLC Topology](path/to/your/image.png)`)*

---

## 📁 Repository Structure

├── 📜 README.md

├── 📁 matlab_scripts/

│   ├── 📄 calculate_parameters.m  (Main script to define specs and calculate components)

│   ├── 📄 plot_gain_characteristics.m (Script to plot the DC gain curve)

│   └── 📄 analyze_results.m       (Script to process and plot simulation output)

├── 📁 simulink_model/

│   └── 📄 CLLC_Converter_Main.slx (The main Simulink model file)

└── 📁 results/

└── (This folder can store exported plots, figures, and data files)

---

## 🔧 Prerequisites

To run the simulations and scripts in this repository, you will need:
* **MATLAB R2022a** or newer.
* **Simulink**.
* **Simscape Electrical™** (formerly SimPowerSystems).

---

## 🚀 How to Run the Simulation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/AhmedMahmoud423/CLLC-Project-.git
    ```
2.  **Open MATLAB.**
3.  **Navigate to the project directory** within MATLAB.
4.  **Run the parameter calculation script** first to populate the MATLAB workspace with the necessary variables:
    ```matlab
    >> cd matlab_scripts
    >> calculate_parameters
    ```
    This script will define variables like `Lr`, `Cr`, `Lm`, `f_sw`, etc., which are used by the Simulink model.
5.  **Open the Simulink model:**
    ```matlab
    >> cd ../simulink_model
    >> open('CLLC_Converter_Main.slx')
    ```
6.  **Run the simulation** by clicking the 'Run' button in the Simulink editor. The simulation is configured to run for [e.g., 0.1 seconds] of simulated time.

---

## ⚙️ Simulation Parameters

The key design specifications can be modified in the `calculate_parameters.m` script:

| Parameter                 | Variable Name | Value                 | Description                          |
| ------------------------- | ------------- | --------------------- | ------------------------------------ |
| Input Voltage             | `Vin`         | `[e.g., 400]` V       | High-side DC voltage                 |
| Output Voltage            | `Vout`        | `[e.g., 48]` V        | Low-side DC voltage                  |
| Rated Power               | `P_rated`     | `[e.g., 3000]` W      | Full load power rating               |
| Switching/Resonant Freq.  | `fs`          | `[e.g., 100e3]` Hz    | Target resonant and switching frequency |
| Transformer Turns Ratio   | `n`           | `[e.g., 4]`           | Primary to secondary turns ratio     |

---

## 📈 Expected Results

After running the simulation, the scopes within the Simulink model will display key waveforms such as:
* Primary side switching voltage and resonant current (to verify ZVS).
* Output voltage and current ripple.
* Secondary side rectifier voltage and current.

You can also run the `analyze_results.m` script to generate plots for your report, such as the efficiency curve vs. load power.

*(It's highly recommended to add screenshots of your key results here. This makes your project look professional and shows what it can do at a glance.)*

![Example Waveform](path/to/your/result_waveform.png)

---

## 👥 Project Team

* **[Your Name]** - [Your Email or GitHub Profile Link]
* **[Teammate 1 Name]** - [Teammate 1 Email or GitHub Profile Link]
* **[Teammate 2 Name]** - [Teammate 2 Email or GitHub Profile Link]
* **[Teammate 1 Name]** - [Teammate 1 Email or GitHub Profile Link]
* **[Teammate 2 Name]** - [Teammate 2 Email or GitHub Profile Link]
* **[Teammate 1 Name]** - [Teammate 1 Email or GitHub Profile Link]
* **[Teammate 2 Name]** - [Teammate 2 Email or GitHub Profile Link]

---

## 👨‍🏫 Supervisor

This project was conducted under the supervision of **‏Dr. Abdelrahman Farghly**, Assistant Professor at the Electrical Power and Machines Department.




