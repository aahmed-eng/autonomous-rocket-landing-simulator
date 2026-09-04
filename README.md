# Autonomous Rocket Landing Simulator

A MATLAB-based simulation of a vertically landing rocket that progressively develops from a simple physics model into an autonomous closed-loop landing system.

This project demonstrates the step-by-step implementation of rocket dynamics using **Euler's Method**, gradually introducing more realistic physics and control algorithms.

---

## Project Overview

The simulator is organized into a series of development builds. Each build introduces a new concept while maintaining the previous functionality, allowing the evolution of the landing algorithm to be followed from a basic physics simulation to an autonomous landing system.

### Build 1 - Constant Mass, Constant Thrust

The initial implementation of the rocket dynamics.

* Constant vehicle mass
* Constant engine thrust
* Basic Euler integration

Run: `Lander.m`

---

### Build 2 - Variable Mass

Introduces fuel consumption.

* Decreasing vehicle mass
* Constant thrust
* Updated equations of motion

Run: `Lander.m`

---

### Build 3 - Aerodynamic Drag

Adds atmospheric effects.

* Variable mass
* Constant thrust
* Velocity-dependent drag

Run: `Lander.m`

---

### Build 4 - Closed-Loop Controller

Introduces autonomous control.

* Feedback controller
* Target vertical velocity set to **0 m/s**
* Automatic thrust adjustment

Run: `Lander.m`

---

### Build 5 - Improved Visualization

Enhances the simulation output.

* Improved plots
* Clearer trajectory visualization
* Better presentation of simulation data

Run: `Lander.m`

---

### Build 6 - Linear Target Velocity

Replaces the constant velocity target with a linear descent profile.

* Linearly varying target velocity
* Smoother landing behaviour
* Improved controller performance

Run: `Lander.m`

---

### Build 7 - Piecewise Linear Target Velocity

Introduces a more realistic descent profile.

* Piecewise linear target velocity
* Improved landing strategy
* Better touchdown characteristics

Run: `Lander.m`

---

### Build 8 - Automated Investigation

Automates testing of multiple descent profiles.

* Batch simulation of PWL models
* Performance comparison
* Parameter investigation

Run: `PWTest.m`

---

# Author

**Ameen Ahmed**
