# VHDL Counter Race Condition

This repository demonstrates a potential race condition in a simple VHDL counter. The `buggy_counter.vhdl` file contains code for a counter that might exhibit unexpected behavior due to the order of signal assignments within the process. The `fixed_counter.vhdl` shows a corrected version that avoids the race condition.

## Problem

In the buggy version, the assignment `count <= 0` within the `if count = 15` block might not be fully completed before the next clock edge.  If the next clock edge arrives while the assignment is still in progress (and count temporarily not 0), incorrect counting behavior will result. This is more likely to occur on some synthesis tools compared to others.

## Solution

The solution uses a temporary variable within the process to ensure that all the signal updates are fully committed before the next clock edge. The revised counter uses proper state management to avoid ambiguity.

## How to run

You need a VHDL simulator (like ModelSim, GHDL, or others) to test these examples. Compile both the buggy and fixed versions and run simulations to compare their behavior, particularly for high clock speeds or under high resource utilisation where the likelihood of encountering this issue increases.
