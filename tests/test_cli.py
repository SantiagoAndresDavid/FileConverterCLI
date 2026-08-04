from utils.logger_config import LoggerConfig


def test_logger_writes_to_file(tmp_path):
    temp_log = tmp_path / "test.log"

    logger = LoggerConfig(log_file=temp_log).get_logger(name="test_cli_logger")
    logger.info("mensaje de prueba")

    assert temp_log.exists()

    content = temp_log.read_text(encoding="utf-8")
    assert "mensaje de prueba" in content
    assert "INFO" in content