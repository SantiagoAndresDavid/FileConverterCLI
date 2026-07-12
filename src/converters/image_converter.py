from PIL import Image
from converters.base_converter import BaseConverter

class ImageConverter(BaseConverter):

    def __init__(self, dest):
        self.dest = dest

    def convert(self, input_path, output_path):
        img = Image.open(input_path)
        img.save(output_path)