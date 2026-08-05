cat > /mnt/data/README.md << 'EOF'
# 📘 FileConverterCLI

FileConverterCLI es un proyecto de Python para construir una librería/CLI que convierta archivos desde la terminal.

---

## ✅ Qué se ha hecho hasta ahora

- Estructura de proyecto con `src/` y `tests/`.
- `pyproject.toml` configurado con `setuptools`, `wheel`, `pytest` y direccionamiento `src`.
- Esqueleto de CLI en `src/cli.py` con parseo de argumentos (`--input`, `--output`, `--dest`, `--force`).
- Aplicación principal en `src/main.py` que integra `cli.parse_args()` y un logger.
- Configuración de logging reutilizable con `utils/logger_config.py` y pruebas en `tests/test_logger.py`.
- `Jenkinsfile` definido para ejecutar build en un agente Docker, correr tests, construir paquete y publicar con `twine`.
- `requirements.txt` presente como referencia de dependencias.

---

## 📁 Estructura actual del proyecto

- `src/`
  - `cli.py` — parseo de argumentos de entrada.
  - `main.py` — punto de entrada de la aplicación.
  - `utils/logger_config.py` — configuración de logging.
  - `converters/` — carpeta vacía o de soporte para futuras implementaciones.
  - `services/` — carpeta para servicios de conversión.
- `tests/`
  - `test_logger.py` — prueba de logging.
- `pyproject.toml` — configuración de paquete y pruebas.
- `Jenkinsfile` — pipeline para build y publicación.

---

## 🧩 Estado funcional actual

- La CLI parsea argumentos correctamente.
- El logger escribe a archivo y está cubierto por test.
- No hay aún lógica de conversión implementada en los convertidores.
- No hay comandos globales instalables definidos en `pyproject.toml`.

---

## 🚧 Qué falta para terminar la librería

1. Implementar el motor de conversión real:
   - Soporte para CSV, JSON, Excel, imágenes, PDF u otros formatos.
   - Detectar formato de entrada y ruta de salida.
2. Completar los servicios y convertidores:
   - Agregar clases/módulos en `src/converters/` y `src/services/`.
   - Implementar transformaciones, validación y manejo de errores.
3. Añadir cobertura de tests para la lógica central:
   - Pruebas unitarias para cada conversión.
   - Pruebas de integración CLI + flujo de archivos.
4. Definir el entry point instalable:
   - Registrar `console_scripts` o `project.scripts` en `pyproject.toml`.
   - Verificar que `pip install .` crea `fileconverter` o `file-converter`.
5. Documentación de uso completa:
   - Ejemplos de comandos reales.
   - Formatos soportados y opciones de salida.
6. Ajustar dependencias reales:
   - Mover dependencias de runtime de `requirements.txt` a `pyproject.toml`.
   - Añadir dependencias para conversión (`pandas`, `openpyxl`, `Pillow`, etc.) sólo si se usan.
7. Mejorar pipeline de CI/CD:
   - Guardar artefactos localmente en `builds/` o `dist/`.
   - Agregar análisis estático / linting si es necesario.

---

## 📌 Cómo ejecutar hoy

1. Crear el entorno virtual e instalar dependencias:
   ```bash
   python -m venv .venv
   .\.venv\Scripts\activate
   python -m pip install -r requirements.txt
   ```

2. Ejecutar la aplicación en modo desarrollo:
   ```bash
   python src/main.py --input archivo.txt --dest json
   ```

3. Correr tests:
   ```bash
   python -m pytest -q
   ```

---

## 🧪 Jenkinsfile actual

El pipeline actual ejecuta:

- `python --version`
- `python -m pip install --upgrade pip`
- `python -m pip install build twine`
- `python -m pytest -q`
- `python -m build`
- `python -m twine upload dist/* --non-interactive`

> Nota: la publicación a PyPI depende de credenciales configuradas en Jenkins.

---

## 📍 Próximos pasos sugeridos

- Terminar la lógica de conversión en `src/converters/`.
- Añadir un comando instalable y documentarlo.
- Cubrir con tests la funcionalidad principal.
- Actualizar `README.md` con ejemplos reales de uso.
- Asegurar que `Jenkinsfile` guarda artefactos y no solo publica.

EOF