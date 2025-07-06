# Kernel - A Simple OS Kernel Project

Welcome to **Kernel** — a bare-metal, from-scratch kernel built for learning, exploration, and absolute domination over the hardware.

This project is handcrafted in low-level languages (Assembly + C), bootstrapped at `0x7C00`, and loaded with knowledge bombs for aspiring OS developers.

---

## 🧪 Features (so far)

-
---

## 🛠️ How to Build & Run

### 🔧 Requirements

- `nasm` (for assembling the bootloader)
- `gcc` (for compiling the kernel)
- `ld` (linker)
- `qemu` or `bochs` or `VirtualBox` (to run the kernel)
- `make` (optional, but pro devs use it)

### 🧱 Build Steps

```bash
nasm -f bin bootloader.asm -o bootloader.bin
gcc -ffreestanding -c kernel.c -o kernel.o
ld -T linker.ld -o kernel.bin kernel.o
cat bootloader.bin kernel.bin > os-image.bin
qemu-system-x86_64 -drive format=raw,file=os-image.bin
