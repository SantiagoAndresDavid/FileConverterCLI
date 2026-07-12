from cli import parse_args
from config import OUTPUT_DIR

def main():
    args = parse_args()

    print("✅ Proyecto File Converter iniciado")
    print(f"📥 Input: {args.input}")
    print(f"📤 Output: {args.output or OUTPUT_DIR}")
    print(f"🎯 Destino: {args.dest}")
    print(f"⚡ Force: {args.force}")

if __name__ == "__main__":
    main()