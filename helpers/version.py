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
    version = f"{version_info['major']}.{version_info['minor']}.{version_info['patch']}"
    if version_info.get("prerelease"):
        version = f"{version}-{version_info['prerelease']}"
    return version


print(extract_version(DOCKERFILE))
