import sys

from entharion.cpu import Cpu


def main() -> int:
    try:
        cpu = Cpu()
    except TypeError as e:
        print(f"Error: {e}")
        return 1

    cpu.run()

    return 0


if __name__ == "__main__":
    sys.exit(main())
