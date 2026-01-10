# LC-3 Basic Calculator

An implementation of a single-digit integer calculator written in LC-3 Assembly language. This project was developed as part of the COMPSCI 210 curriculum.

## 🚀 Overview

This program simulates a basic calculator using the LC-3 (Little Computer 3) architecture. It performs arithmetic operations on single-digit operands (0-9) and outputs the result in a formatted equation.

## 🛠 Features

- **Input Handling:** Prompts for two operands and an operation index

- **Supported Operations:**
  1. Addition (+)
  2. Subtraction (-)
  3. Multiplication (*) - Implemented via iterative addition
  4. Floor Division (/) - Implemented via iterative subtraction
  5. Modulo (%) - Returns the remainder

- **Error Handling:** Detects results outside the 0-9 range and displays "OUT OF BOUNDS"

- **Continuous Execution:** The program restarts for new calculations until the user presses `Enter` to halt

## 💻 How to Run

To run this program, you will need an LC-3 Simulator.

### Steps:

1. Open your LC-3 Simulator
2. Assemble the `A1.asm` file to generate the `.obj` file
3. Load the `.obj` file into the simulator
4. Click **Continue** or **Run**
5. Follow the console prompts to enter operands and operation indices

### Recommended Simulators:

- **LC-3 Simulator** (Official Pennsylvania State University simulator)
- **LC-3Edit** (Windows-based simulator)
- **LC-3Tools** (Cross-platform simulator)

## 📝 Example Usage

### Addition Example

```
Enter the first operand: 5
Enter the operation index: 1
Enter the second operand: 3
5 + 3 = 8
```

### Multiplication Example

```
Enter the first operand: 2
Enter the operation index: 3
Enter the second operand: 4
2 * 4 = 8
```

### Division Example

```
Enter the first operand: 9
Enter the operation index: 4
Enter the second operand: 2
9 / 2 = 4
```

### Out of Bounds Example

```
Enter the first operand: 8
Enter the operation index: 1
Enter the second operand: 5
8 + 5 = OUT OF BOUNDS
```

## 🔍 Technical Details

### Architecture

- **Platform:** LC-3 (Little Computer 3)
- **Language:** LC-3 Assembly
- **Word Size:** 16-bit
- **Register Count:** 8 general-purpose registers (R0-R7)

### Implementation Details

- **Conditional Branching:** Used to select operations based on the user-provided index (stored in R2)

- **Register Usage:**
  - `R1`: First operand
  - `R2`: Operation index
  - `R3`: Second operand
  - `R4`: Calculation result
  - `R5/R6`: ASCII conversion offsets

- **Multiplication Algorithm:** Iterative addition (adds the first operand to itself the number of times specified by the second operand)

- **Division Algorithm:** Iterative subtraction (subtracts the divisor from the dividend until the result is less than the divisor)

- **Modulo Algorithm:** Returns the remainder after performing floor division

### Operation Index Reference

| Index | Operation | Symbol |
|-------|-----------|--------|
| 1     | Addition  | +      |
| 2     | Subtraction | -    |
| 3     | Multiplication | * |
| 4     | Floor Division | / |
| 5     | Modulo | % |

## 📋 Input Constraints

- **Operands:** Single-digit integers (0-9)
- **Operation Index:** Integer 1-5
- **Output Range:** Results must be in the range 0-9, otherwise "OUT OF BOUNDS" is displayed

## 🎓 Educational Context

This project demonstrates fundamental concepts in computer architecture:

- Low-level programming using assembly language
- Register-based computation
- Conditional branching and control flow
- Iterative algorithms for arithmetic operations
- ASCII character encoding and conversion
- Memory management in a simplified ISA (Instruction Set Architecture)

## 🐛 Known Limitations

- Only supports single-digit operands (0-9)
- Results outside 0-9 range cannot be displayed numerically
- Division by zero behavior depends on simulator implementation
- No support for negative numbers
- No floating-point arithmetic

## 🚧 Potential Enhancements

- Support for multi-digit numbers
- Negative number handling with two's complement
- Additional operations (exponentiation, square root)
- Improved error messages for specific error conditions
- History of previous calculations

## 📚 Resources

- [LC-3 Architecture Documentation](https://www.jmeiners.com/lc3-vm/)
- [LC-3 Instruction Set Reference](https://www.cs.utexas.edu/users/fussell/courses/cs310h/lectures/lc3.pdf)

**Note:** This calculator is designed for educational purposes to understand low-level computing. For practical calculations, use higher-level programming languages or calculator applications.
