
from src.cli import parse_args
from src.services.converter_service import ConverterService
from src.services.logger_service import get_logger

def main():
    logger = get_logger()

    logger.info("🚀 Iniciando aplicación")

    try:
        args = parse_args()
        logger.info(f"📥 Argumentos recibidos: {args}")

        service = ConverterService(
            input_path=args.input,
            output_path=args.output,
            destination=args.dest,
            force=args.force,
        )

        logger.info("🔄 Ejecutando servicio de conversión")
        service.run()

        logger.info("✅ Proceso finalizado correctamente")

    except Exception as e:
        logger.error(f"❌ Error en main: {e}", exc_info=True)
        print("❌ Ocurrió un error. Revisa logs.")

if __name__ == "__main__":
    main()
