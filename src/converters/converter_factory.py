from converters.csv_converter import CSVConverter
from converters.image_converter import ImageConverter
from converters.pdf_converter import PDFConverter

class ConverterFactory:

    @staticmethod
    def get_converter(file_type: str, dest: str):
        if file_type == "csv":
            return CSVConverter(dest)
        elif file_type in ["png", "jpg", "jpeg"]:
            return ImageConverter(dest)
        elif file_type == "pdf":
            return PDFConverter(dest)
        else:
            raise ValueError(f"No hay conversor para {file_type}")