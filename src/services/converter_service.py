class ConverterService:
    def __init__(self, converter):
        self.converter = converter

    def convert(self, input_file: str, output_file:str, destination: str, force: bool):
        try:
            
            self.converter.convert(input_file, output_file)
            return True
        except Exception as e:
            raise RuntimeError(f"Error al convertir el archivo: {e}")