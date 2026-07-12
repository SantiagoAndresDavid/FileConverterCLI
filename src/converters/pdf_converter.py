from reportlab.pdfgen import canvas
from converters.base_converter import BaseConverter

class PDFConverter(BaseConverter):

    def __init__(self, dest):
        self.dest = dest

    def convert(self, input_path, output_path):
        c = canvas.Canvas(str(output_path))
        c.drawString(100, 750, f"Archivo convertido: {input_path}")
        c.save()