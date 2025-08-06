# 🧠 System Identification and Signal Processing with MATLAB

This repository includes multiple MATLAB scripts on **system identification**, **parameter estimation**, **signal processing**, and **numerical methods**. All examples are based on synthetic data or models and illustrate concepts in filtering, estimation, and simulation.

Developed as part of academic experimentation in system modeling and signal analysis.

---

## 📁 Contents

### 📐 Numerical Differentiation & Integration

- **`Numerical_Differentiation.m`**  
  Estimates derivatives of a sine signal using forward, backward, and central differences.

- **`effect_of_noise_on_derivative.m`**  
  Shows how noise affects numerical differentiation and compares with the true derivative.

- **`euler_integration.m`**  
  Solves the ODE `dx/dt = -2x` using Euler integration and compares to the exact solution.

---

### 🔊 Signal Filtering

- **`signal_filtering.m`**  
  Compares multiple filters (moving average, Butterworth, Savitzky-Golay) on a noisy sine signal.

- **`noise_cancellation_demo.m`**  
  Demonstrates the effect of additive measurement noise and uses filters (Butterworth, lowpass, moving average) to suppress it.

---

### 🧮 Least Squares Estimation

- **`lsq_mass_spring.m`**  
  Estimates mass `m` and spring constant `k` from position and acceleration data via linear regression.

- **`lsq_omega_estimation.m`**  
  Estimates natural frequency `ω` from known position and acceleration using least squares.

- **`lsq_arx_model.m`**  
  Identifies the parameters of an ARX (Auto-Regressive with eXogenous input) model from simulated input-output data.

- **`mass_spring_simulation_and_estimation.m`**  
  Simulates a mass-spring system with `ode45` and estimates its parameters afterward from generated data.

---

### 🔁 Recursive Least Squares (RLS)

- **`rls_mass_spring.m`**  
  Online estimation of `m` and `k` using recursive least squares on a dynamic model.

- **`rls_omega_estimation.m`**  
  Real-time estimation of `ω²` from synthetic position and acceleration using RLS with forgetting factor.

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

**[Your Name]**  
Student / Engineer  
ECE AUTH – School of Electrical & Computer Engineering

---

## 🧾 License

This repository is licensed under the [MIT License](https://opensource.org/licenses/MIT).

---
