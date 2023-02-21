#!/usr/bin/python3
"""Addon support for Volto."""
from pathlib import Path
from typing import Tuple

import json
import logging
import os


logger = logging.getLogger("Volto Helper")


APP_FOLDER = Path("/app").resolve()
PACKAGE_JSON_PATH = (APP_FOLDER / "package.json").resolve()
JSCONFIG_PATH = (APP_FOLDER / "jsconfig.json").resolve()


ADDON_NAME = os.environ.get("ADDON_NAME", "")


def add_packages_to_package_json(config: dict, packages: dict) -> dict:
    """Add addons to the main `package.json`."""
    addons = config.get("addons", [])
    workspaces = config.get("workspaces", [])
    for pkg_name, pkg_path in packages.items():
        addons.append(pkg_name)
        workspace_path = pkg_path.replace("/src", "")
        workspaces.append(f"src/{workspace_path}")
    config["addons"] = addons
    config["workspaces"] = workspaces
    return config


def parse_jsonconfig(config: dict) -> dict:
    """Parse existing `jsconfig.json`."""
    packages = {}
    config_paths = config.get("compilerOptions", {}).get("paths", {})
    for pkg_name, pkg_path in config_paths.items():
        if isinstance(pkg_path, list):
            packages[pkg_name] = pkg_path[0]
    return packages


def parse_addon_name(addon_name: str) -> Tuple[str, str]:
    """Parse the addon name and return also its probable path."""
    if addon_name.startswith("@"):
        _, path = addon_name.split("/")
        return addon_name, path
    return addon_name, addon_name


def addon_to_package_json(config: dict, addon_name: str, addon_path: str) -> dict:
    """Add a single addon to main `package.json`."""
    config["addons"].append(addon_name)
    workspaces = config.get("workspaces", [])
    workspaces.append(f"src/addons/{addon_path}")
    config["workspaces"] = workspaces
    return config


def addon_to_jsconfig_json(config: dict, addon_name: str, addon_path: str) -> dict:
    """Add a single addon to `jsconfig.json`."""
    if "compilerOptions" not in config:
        config["compilerOptions"] = {}
    if "paths" not in config:
        config["compilerOptions"]["paths"] = {}

    config["compilerOptions"]["paths"][addon_name] = [f"addons/{addon_path}/src"]
    return config


if ADDON_NAME:
    logger.info("Processing the ADDON_NAME variable.")
    SETTINGS = (
        (addon_to_package_json, PACKAGE_JSON_PATH),
        (addon_to_jsconfig_json, JSCONFIG_PATH),
    )
    addon_name, addon_path = parse_addon_name(ADDON_NAME)
    for func, path in SETTINGS:
        data = func(json.load(open(path)), addon_name=addon_name, addon_path=addon_path)
        json.dump(data, open(path, "w"), indent=2)
else:
    packages = {}
    if JSCONFIG_PATH.exists():
        packages = parse_jsonconfig(json.load(open(JSCONFIG_PATH)))

    if not packages:
        logger.warning("Existing jsconfig.json does not contain packages.")
    else:
        logger.info("Processing existing jsconfig.json.")
        package_json = json.load(open(PACKAGE_JSON_PATH))
        # Process package_json
        package_json = add_packages_to_package_json(package_json, packages)
        json.dump(package_json, open(PACKAGE_JSON_PATH, "w"), indent=2)
