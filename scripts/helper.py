#!/usr/bin/python3
"""Addon support for Volto."""
from pathlib import Path

import json
import logging
import os

logger = logging.getLogger("Volto Helper")


APP_FOLDER = Path("/app").resolve()
PACKAGE_JSON_PATH = APP_FOLDER / "package.json"
JSCONFIG_PATH = APP_FOLDER / "jsconfig.json"

ADDON_NAME = os.environ.get("ADDON_NAME", "")


def process_package_json(config: dict, addon_name: str) -> dict:
    config["addons"].append(addon_name)
    workspaces = config.get("workspaces", [])
    workspaces.append(f"src/addons/{addon_name}")
    config["workspaces"] = workspaces
    return config


def process_jsconfig_json(config: dict, addon_name: str) -> dict:
    if "compilerOptions" not in config:
        config["compilerOptions"] = {}
    if "paths" not in config:
        config["compilerOptions"]["paths"] = {}

    config["compilerOptions"]["paths"][addon_name] = [
        f"addons/{addon_name}/src"
    ]
    return config


if not ADDON_NAME:
    logger.warning("No ADDON_NAME variable was set.")
else:
    SETTINGS = (
        (process_package_json, PACKAGE_JSON_PATH),
        (process_jsconfig_json, JSCONFIG_PATH),
    )

    for func, path in SETTINGS:
        data = func(json.load(open(path)), addon_name=ADDON_NAME)
        json.dump(data, open(path, "w"), indent=2)
