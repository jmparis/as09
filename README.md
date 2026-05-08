# AS09 - Assembler for M6809/H6309 Microprocessor

AS09 is a fast, two-pass assembler for the Motorola 6809 and Hitachi 6309 microprocessors. It reads ASCII text files containing assembly language instructions and produces binary, Motorola S-record, or Intel hex output files.

## Features

- **Fast two-pass assembly**: Efficient processing of assembly source code
- **Multiple output formats**: Supports binary files, Motorola S-records, and Intel hex files
- **Debug information generation**: Optional debug file for in-system debugging or simulators
- **Three segments**: Code, data, and BSS segments for ROM-based programs
- **Struct keyword**: Easy declaration of data structures
- **Instruction cycle counting**: Shows number of cycles per instruction in listings
- **Full conditional assembly**: With CPU identifying defines
- **C-style expressions**: Accepts base 2-36, 32-bit calculations
- **Macro capability**: Full macro support with parameters
- **6309 extensions**: Support for additional Hitachi 6309 instructions and addressing modes (enabled with -x option)
- **Cross-platform**: Runs under Linux and Windows

## Installation

### Prerequisites

- Linux or Windows system
- For Windows, DOS box with long file name support

### Installing from Source

1. Clone or download the AS09 distribution
2. The pre-compiled binaries are included:
   - `as09` (Linux executable)
   - `as09.exe` (Windows executable)
   - `AS09-DOS.EXE` (DOS executable)

3. Install to your local bin directory:
   ```bash
   make install
   ```

   This will:
   - Copy the executable to `~/.local/bin/`
   - Copy the manual page to `~/.local/share/man/man1/`
   - Update the man database

### Uninstalling

To remove the local installation:
```bash
make clean_install
```

## Usage

```
as09 [-cdghilnopqstvwxz] file
```

### Options

- `-c`: Show number of cycles per instruction in listing
- `-d<name>`: Define a label before assembly (default: DEBUG)
- `-g`: Generate source-level debug information file
- `-h<lines>`: Specify page height for listing (default: 60 lines, 0 for infinite)
- `-i`: Ignore case in opcodes (labels still case-sensitive)
- `-l`: Generate pass 2 listing
- `-l<filename>`: Specify listing file name
- `-m`: Show macro expansions in listing
- `-n`: Disable optimizations
- `-o<filename>`: Specify binary or s-records output file name
- `-p`: Generate pass 1 listing
- `-q`: Quiet mode (no running line counter)
- `-s`: Write s-records instead of binary file
- `-s2`: Write intel-hex file instead of binary file
- `-t`: Generate symbol table
- `-v`: Verbose mode
- `-w<width>`: Specify column width (60-200)
- `-x`: Use 6309 extensions
- `-z`: Fill unused memory with zeros

### File Extensions

The assembler automatically appends extensions if not specified:
- Source files: `.a09`, `.asm`, `.s`
- Binary output: `.bin`
- S-records: `.s19`
- Intel hex: `.hex`
- Listing: `.lst`

### Example Usage

```bash
# Assemble with listing and symbol table
as09 -l -t myprogram.a09

# Generate S-record output with cycle counts
as09 -s -c -o myprogram.s19 myprogram.a09

# Enable 6309 extensions and debug info
as09 -x -g myprogram.a09
```

## Examples

See the included `testcase.a09` file for a comprehensive example demonstrating various assembler features including:

- Conditional assembly
- Macros
- Struct definitions
- Different addressing modes
- 6309 extensions

To assemble the test case:
```bash
as09 -l testcase.a09
```

## Supported Instructions

AS09 supports the complete 6809 instruction set plus 6309 extensions when enabled. This includes all standard instructions like:

- Arithmetic: ADD, SUB, MUL, DIV
- Logic: AND, OR, EOR, CMP
- Shifts: ASL, ASR, LSL, LSR
- Branches: BRA, BSR, BCC, BCS, BEQ, BNE, etc.
- Loads/Stores: LDA, STA, LDB, STB, etc.
- Stack operations: PSHS, PULS, PSHU, PULU
- And many more...

## Addressing Modes

- Inherent
- Immediate
- Direct
- Extended
- Indexed (all variants)
- Program counter relative
- Indirect modes
- 6309-specific modes when enabled

## Pseudo-Instructions

- `org`: Set origin address
- `equ`: Define constants
- `db/dw`: Define bytes/words
- `ds/rmb`: Reserve memory
- `if/else/endif`: Conditional assembly
- `macro/endm`: Macro definitions
- `include`: Include other files
- `struct/end struct`: Structure definitions
- And more...

## License

This software is freely distributable on the net, provided this documentation accompanies the assembler and no copyright messages are removed.

You are explicitly NOT allowed to sell this software for anything more than a reasonable copying fee (say US$5).

## Author

**Frank A. Kingswood**

- Email: as@kingswood-consulting.co.uk
- Website: http://www.kingswood-consulting.co.uk/assemblers/

## Version

Current version: 1.42

## Bugs and Limitations

- No provision for linking other pre-assembled modules
- Escape sequences in strings can't use `\x<digits>` and `\<digits>` formats
- No support for 6809/6309 floating point instructions

