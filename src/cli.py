import argparse


def parse_args():
    parser = argparse.ArgumentParser(
        prog="file-converter",
        description="📚 Convertidor de archivos simple (CSV, imágenes, PDF, etc.)",
        epilog="Ejemplo: python main.py --input data.csv --dest json",
    )

    parser.add_argument(
        "--input", required=True, help="📥 Archivo o carpeta de entrada"
    )
    parser.add_argument("--output", help="📤 Carpeta de salida (opcional)")
    parser.add_argument(
        "--dest", required=True, help="🎯 Formato destino (json, xlsx, png...)"
    )
    parser.add_argument(
        "--force", action="store_true", help="⚡ Sobrescribir archivos existentes"
    )

    return parser.parse_args()
