from pathlib import Path
import re


DOCKERFILE = Path("Dockerfile").resolve()

PATTERN = r"ENV VOLTO_([^=]*)=([^\n]*)"


def extract_version(path: Path) -> str:
    """Extract version from Dockerfile."""
    data = open(path, "r").read()
    matches = re.findall(PATTERN, data)
    version_info = {}
    for match in matches:
        version_info[match[0].lower()] = match[1]
    return f"{version_info['major']}.{version_info['minor']}.{version_info['patch']}{version_info['prerelease']}"

print(extract_version(DOCKERFILE))
