import logging

class LoggerConfig:
    def get_logger(self):
        logger = logging.getLogger("app_logger")
        logger.setLevel(logging.INFO)

        if not logger.handlers:
            handler = logging.FileHandler("app.log")
            formatter = logging.Formatter(
                "%(asctime)s - %(levelname)s - %(message)s"
            )
            handler.setFormatter(formatter)
            logger.addHandler(handler)

        return logger