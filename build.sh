#!/usr/bin/env bash

TMP=$(mktemp -d)
trap 'rm -rf -- "$TMP"' EXIT

dotnet publish -o $TMP/build
mkdir -p $TMP/addons/counterstrikesharp/plugins/SharpTimer
cp $TMP/build/*.dll $TMP/addons/counterstrikesharp/plugins/SharpTimer
cp -r cfg $TMP

pushd $TMP
    zip -r SharpTimer.zip addons cfg
popd
cp $TMP/SharpTimer.zip .
