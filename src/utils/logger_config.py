# logger.py
import logging

from config import LOG_FILE


class LoggerConfig:
    def __init__(self, log_file=None):
        self.log_file = log_file or LOG_FILE

    def get_logger(self, name="app"):
        logger = logging.getLogger(name)
        if not logger.handlers:
            handler = logging.FileHandler(self.log_file, encoding="utf-8")
            formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
            handler.setFormatter(formatter)
            logger.addHandler(handler)
            logger.setLevel(logging.INFO)
        return logger


logger = LoggerConfig().get_logger()
