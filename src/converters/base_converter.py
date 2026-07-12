from abc import ABC, abstractmethod
from pathlib import Path

class BaseConverter(ABC):
    """
    Clase base para todos los conversores.
    Define la interfaz que deben cumplir.
    """

    def __init__(self, dest_format: str):
        self.dest_format = dest_format

    @abstractmethod
    def convert(self, input_path: Path, output_path: Path):
        """
        Método obligatorio que cada conversor debe implementar.
        """
        pass

    def validate_paths(self, input_path: Path, output_path: Path):
        """
        Validaciones básicas reutilizables.
        """
        if not input_path.exists():
            raise FileNotFoundError(f"El archivo no existe: {input_path}")

        if input_path.is_dir():
            raise ValueError("Se esperaba un archivo, no una carpeta")

        output_path.parent.mkdir(parents=True, exist_ok=True)