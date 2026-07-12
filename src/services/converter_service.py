from pathlib import Path

from converters.converter_factory import ConverterFactory
from services.file_service import FileService
from services.logger_service import get_logger
from utils.validartor import validate_input


class ConverterService:

    def __init__(self, input_path, output_path, destination, force=False):
        self.input_path = input_path
        self.output_path = Path(output_path) if output_path else Path("output")
        self.destination = destination
        self.force = force
        self.logger = get_logger()
    
    def run(self):
        validate_input(self.input_path)
        if FileService.is_file(self.input_path):
            self._convert_file(Path(self.input_path))
    
    def _convert_file(self, file_path: Path):
        file_type = file_path.suffix.replace(".","")
        converter = ConverterFactory.get_converter(file_type, self.destination)