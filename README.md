# Implementation-of-Arithmetic-operations-for-Floating-point-using-HDL-in-Vivado-Cadence
 To develop algorithm for Floating Point operations like addition, subtraction, division, multiplication using Verilog (Vivado) and  synthesize (Cadence)

# 1. Floating-Point Unit 
When a CPU executes a program that is calling for a floating-point (FP) operation, there are three ways by which it can carry out the operation. Firstly, it may call a floating-point unit emulator, which is a floating-point library, using a series of simple fixed-point arithmetic operations which can run on the integer ALU. These emulators can save the added hardware cost of a FPU but are significantly slow. Secondly, it may use an add-on FPUs that are entirely separate from the CPU, and are typically sold as an optional add-on which are purchased only when they are needed to speed up math-intensive operations. Else it may use integrated FPU present in the system [2]. The FPU designed by us is a single precision IEEE754 compliant integrated unit. It can handle not only basic floating-point operations like addition, subtraction, multiplication and division but can also handle operations like shifting, square root determination and other transcendental functions like sine, cosine and tangential function.


# 2. IEEE 754 STNDARDS 
IEEE754 standard is a technical standard established by IEEE and the most widely used standard for floating-point computation, followed by many hardware (CPU and FPU) and software implementations [3]. Single-precision floating-point format is a computer number format that occupies 32 bits in a computer memory and represents a wide dynamic range of values by using a floating point. In IEEE 754-2008, the 32-bit with base 2 format is officially referred to as single precision or binary32. It was called single in IEEE 754-1985. The IEEE 754 standard specifies a single precision number as having sign bit which is of 1 bit length, an exponent of width 8 bits and a significant precision of 24 bits out of which 23 bits are explicitly stored and 1 bit is implicit 1. Sign bit determines the sign of the number where 0 denotes a positive number and 1 denotes a negative number. It is the sign of the mantissa as well. Exponent is an 8-bit signed integer from −128 to 127 (2's Complement) or can be an 8-bit unsigned integer from 0 to 255 which is the accepted biased form in IEEE 754 single precision definition. In this case an exponent with value 127 represents actual zero. The true mantissa includes 23 fraction bits to the right of the binary point and an implicit leading bit (to the left of the binary point) with value 1 unless the exponent is stored with all zeros. Thus only 23 fraction bits of the mantissa appear in the memory format but the total precision is 24 bits.
                 For example:  S  EEEEEEEE FFFFFFFFFFFFFFFFFFFFFFF
                               31 30           23  22            0
IEEE754 also defines certain formats which are a set of representation of numerical values and symbols. It may also include how the sets are encoded. The standard defines:
 • Arithmetic formats which are sets of binary and decimal floating-point numbers, which consists of finite numbers including subnormal number and signed zero, a special value called "not a number” (NaN) and infinity. 
• Interchange formats which are bit strings (encodings) that are used to exchange a floating-point data in a compact and efficient form. 
• Rounding rules which are the properties that should be satisfied while doing arithmetic operations and conversions of any numbers on arithmetic formats. 
• Exception handling which indicates any exceptional conditions (like division by zero, underflow, overflow, etc.) occurred during the operations


# Block Diagram of Floating-Point Unit
<img width="977" height="630" alt="image" src="https://github.com/user-attachments/assets/b30ebaf8-3170-4ba0-a621-e7c6d8e0580f" />


## ✨ Functionalities with Examples

- **Adder/Subtractor** → Align exponents, add/subtract significands, normalize, handle carry/borrow, set result sign.  
  *Addition Example:* Two numbers with same sign → shift smaller significand, add, normalize.  
  *Subtraction Example:* Two numbers with different signs → take 2’s complement of smaller significand, add, normalize by shifting left until MSB=1, adjust exponent, set sign of larger operand.  

- **Multiplier** → Multiply significands, add exponents (minus bias), normalize, round, detect overflow/underflow.  
  *Example:* E = E1 + E2 – 127, sign = S1 ⊕ S2.  

- **Divider** → Divide significands, subtract exponents, normalize, round, detect exceptions.  
  *Example:* M = M1 / M2, E = E1 – E2, sign = S1 ⊕ S2.  

- **OR (||)** → True if either input is true.  
  *Example:* A=0, B=1 → A||B = 1.  

- **AND (&&)** → True only if both inputs are true.  
  *Example:* A=1, B=0 → A&&B = 0.  

- **XOR (⊕)** → True if inputs differ.  
  *Example:* A=1, B=0 → A⊕B = 1.  

- **Left Shift (<<)** → Multiply by 2^n.  
  *Example:* 22 << 2 → 88 (00010110 → 01011000).  

- **Right Shift (>>)** → Divide by 2^n.  
  *Example:* 32 >> 2 → 8 (100000 → 1000).  

- **Floating‑Point to Normal** → Displays mantissa with exponent in decimal.  

- **Complement** → Converts binary input to its complement form.  

# Software And Hardware Tools
1.	Vivado Design Suite
2.	Field Programmable Gate Array (FPGA)
3.	Cadence

# RTL View
<img width="1013" height="884" alt="image" src="https://github.com/user-attachments/assets/20b18c80-f2da-4fff-afad-6ff1cbd92329" />

## Addition Simulation result (Other results are not uploaded to keep clean page)
<img width="975" height="445" alt="image" src="https://github.com/user-attachments/assets/fe8631ab-2eec-42e4-9183-c4ae698866e4" />

## Layout view (Other results are not uploaded to keep clean page)
<img width="909" height="511" alt="image" src="https://github.com/user-attachments/assets/308afeb4-3f4d-4b39-8fb4-74a5e1d10240" />



