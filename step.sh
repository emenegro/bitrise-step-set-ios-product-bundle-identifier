#!/bin/bash

# fail if any commands fails
set -e

# Exists if no provided parameters.
if [ -z "${project_path}" ]; then
  echo "[ERROR] Missing required input: project_path"
  exit 1
fi
if [ -z "${current_bundle_identifier}" ]; then
  echo "[ERROR] Missing required input: current_bundle_identifier"
  exit 1
fi

if [ -z "${new_bundle_identifier}" ]; then
  echo "[ERROR] Missing required input: new_bundle_identifier"
  exit 1
fi

# Exits if project file does not exists
PBXPROJ_FILE="${project_path}/project.pbxproj"
if [ ! -f $PBXPROJ_FILE ]; then
    echo "[ERROR] Project file not found: ${project_path}"
    exit 1
fi

# Info statements
echo "[INFO] Path of .xcodeproj file:		${project_path}"
echo "[INFO] Current Bundle Identifier: 	${current_bundle_identifier}"
echo "[INFO] New Bundle Identifier: 		${new_bundle_identifier}"

# Replaces the setting PRODUCT_BUNDLE_IDENTIFIER in the .pbxproj file.
echo ""
echo "Replacing..."
sed -i "" "s/PRODUCT_BUNDLE_IDENTIFIER = ${current_bundle_identifier}/PRODUCT_BUNDLE_IDENTIFIER = ${new_bundle_identifier}/g" $PBXPROJ_FILE
echo ""
echo "[SUCCESS] Replace done!"
