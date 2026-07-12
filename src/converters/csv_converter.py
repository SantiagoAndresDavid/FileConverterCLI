import pandas as pd
from converters.base_converter import BaseConverter

class CSVConverter(BaseConverter):

    def __init__(self, dest):
        self.dest = dest

    def convert(self, input_path, output_path):
        df = pd.read_csv(input_path)

        if self.dest == "json":
            df.to_json(output_path, orient="records", indent=2)
        elif self.dest == "xlsx":
            df.to_excel(output_path, index=False, engine="openpyxl")