# logger.py
import logging
from src.config import LOG_FILE
logger = logging.getLogger("app")

if not logger.handlers:
    handler = logging.FileHandler(LOG_FILE, encoding="utf-8")
    formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
    handler.setFormatter(formatter)
    logger.addHandler(handler)

logger.setLevel(logging.INFO)