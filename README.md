# 🧠 System Identification and Signal Processing with MATLAB

This repository includes multiple MATLAB scripts on **system identification**, **parameter estimation**, **signal processing**, and **numerical methods**. All examples are based on synthetic data or models and illustrate concepts in filtering, estimation, and simulation.

Developed as part of academic experimentation in system modeling and signal analysis.

---

## 📁 Contents

### 📐 Numerical Differentiation & Integration

- **`Numerical_Differentiation.m`**  
  Estimates derivatives of a sine signal using forward, backward, and central differences.

- **`Effect_of_Noise.m`**  
  Shows how noise affects numerical differentiation and compares with the true derivative.

- **`Euler_Integration.m`**  
  Solves the ODE `dx/dt = -2x` using Euler integration and compares to the exact solution.

---

### 🔊 Signal Filtering

- **`Signal_Filtering.m`**  
  Compares multiple filters (moving average, Butterworth, Savitzky-Golay) on a noisy sine signal.

- **`noisy_data.m`**  
  Demonstrates the effect of additive measurement noise and uses filters (Butterworth, lowpass, moving average) to suppress it.

---

### 🧮 Least Squares Estimation

- **`Mass_Spring_LS.m`**  
  Estimates natural frequency `ω` from known position and acceleration using least squares.
  
- **`Mass_Spring_RLS.m`**  
  Real-time estimation of `ω²` from synthetic position and acceleration using RLS with forgetting factor.

- **`ARX_model.m`**  
  Identifies the parameters of an ARX (Auto-Regressive with eXogenous input) model from simulated input-output data.

- **`Mass_Spring.m`**  
  Simulates a mass-spring system with `ode45` and estimates its parameters afterward from generated data.

---

## 📊 Plots and Output

All scripts generate figures and console outputs to visualize:
- estimation convergence,
- signal comparisons (clean vs noisy vs filtered),
- model accuracy and fit.

---

## 📄 Requirements

- MATLAB R2020b or later  
- Signal Processing Toolbox  
- Control System Toolbox (optional)  

---

## ✍️ Author

**Vasileios Barmpagiannos**  
Studen
ECE AUTH – School of Electrical & Computer Engineering

---

## 🧾 License

This repository is licensed under the [MIT License](https://opensource.org/licenses/MIT).

---
