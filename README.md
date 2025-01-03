## SPI Slave with Single Port RAM

### Project Overview
This project implements an SPI (Serial Peripheral Interface) slave with a single-port RAM, using a finite state machine (FSM). The design explores three different FSM encoding styles (Gray, One-Hot, and Sequential) to achieve the highest operating frequency based on timing performance.
### Design:
![image](https://github.com/user-attachments/assets/34b5e80c-1163-49a3-aa41-f7f7af12be78)

---

### Features
1. **SPI Slave Functionality**:
   - Inputs: `rst_n`, `SS_n`, `MOSI`, `clk`
   - Output: `MISO`
   - Functionalities include reading from and writing to RAM via SPI.

2. **FSM Encoding Evaluation**:
   - Gray, One-Hot, and Sequential encoding styles were implemented.
   - The encoding with the best timing performance was chosen based on setup/hold slack in the timing report.

3. **Debug Core Integration**:
   - Internals like `MISO`, `MOSI`, `SS_n`, `rst_n`, and `clk` are accessible for debugging.
   - Waveform data captured via QuestaSim for analysis.
---

### Hardware Setup (If we used an FPGA)
- **Constraints**:
  - `rst_n`, `SS_n`, and `MOSI`: Connected to switches.
  - `MISO`: Connected to an LED.

---

### Design and Verification
1. **FSM Implementation**:
   - Designed using a synchronous active-low reset.
   - Evaluated three encoding styles for optimal performance.
### The FSM Transition Diagram of the SPI Slave
![image](https://github.com/user-attachments/assets/a76810b1-70ef-4581-82c0-e29c1fd86e7c)
### Transition in the write address
![image](https://github.com/user-attachments/assets/6f22be2d-e5a3-46d0-b511-60fb00797b0e)
### Transition in the read address 
![image](https://github.com/user-attachments/assets/f953371d-900b-4fc7-ae6c-ca6f161e8f12)



2. **Testbench**:
   - Verified state transitions through SPI interactions with RAM by doing an SPI Wrapper, which you can find in the repository here by the file name "Wrapper_tb.v".

3. **Timing and Synthesis Analysis**:
   - Generated reports highlighting critical paths and performance metrics.

---

