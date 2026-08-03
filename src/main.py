from cli import parse_args
from utils.logger_config import logger

def main():
    logger.info("🚀 Iniciando aplicación")
    
    try:
        args = parse_args()
        logger.info(f"📥 Argumentos recibidos: {args}")
        logger.info("✅ Proceso finalizado correctamente")

    except Exception as e:
        logger.error(f"❌ Error en main: {e}", exc_info=True)
        print("❌ Ocurrió un error. Revisa logs.")

if __name__ == "__main__":
    main()