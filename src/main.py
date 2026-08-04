from cli import parse_args
from utils.logger_config import logger


def main():
    logger.info("🚀 Iniciando aplicación")

    try:
        args = parse_args()
        logger.info(f"📥 Argumentos recibidos: {args}")
        logger.info("✅ Proceso finalizado correctamente")

    except KeyboardInterrupt:
        logger.warning("Proceso interrumpido por el usuario")

    except ValueError as e:
        logger.error(f"Error de valor: {e}", exc_info=True)


if __name__ == "__main__":
    main()
