from pathlib import Path

def validate_input(path: str):
    validate_path = Path(path)

    if not validate_path.exists():
        raise FileNotFoundError(f"No existe: {path}")
    
    return True