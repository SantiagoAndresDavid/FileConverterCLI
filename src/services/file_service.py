from pathlib import Path

class FileService:

    @staticmethod
    def is_file(path: str):
        return Path(path).is_file()
    
    @staticmethod
    def is_directory(path: str):
        return Path(path).is_dir()
    
    @staticmethod
    def get_files_from_dir(path: str):
        return list(Path(path).glob("*")) 
    """
    El módulo glob es una herramienta en Python que permite realizar búsquedas de archivos y directorios basadas en patrones. 
    Utiliza una sintaxis similar a la de las terminales de Unix, lo que significa que puedes usar caracteres comodín como:

        Asterisco (*): Coincide con cualquier cantidad de caracteres.
        Interrogación (?): Coincide con un solo carácter.
        Corchetes ([]): Coinciden con cualquier carácter dentro del rango especificado.
    """