#!/bin/bash

rm -rf build

cmake -Bbuild -H. -DXGEN_DIR=/usr/autodesk/maya/plug-ins/xgen/
