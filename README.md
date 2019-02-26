# Simple XGen Interactive Grooming spline to CyHair converter.

XGen Interactive Grooming Spline to CyHair converter using XGen Spline API.

CyHair file format http://www.cemyuksel.com/cyCodeBase/soln/using_hair_files.html is one of commonly used Hair/Fur file format.

![Maya-preview](images/maya-preview.jpg?raw=true)
![glTF-preview](images/gltf-spline-draw.png?raw=true)

## Requirements

* Maya 2018.2(Maya 2017 may work, but not tested)
  * Tested on Linux only.
* CMake
* C++11 compiler

## How to compile

Specify the path to Maya XGen package(Usually `/usr/autodesk/maya/plug-ins/xgen` for Linux environment) to `XGEN_DIR` option.


```
$ cmake -Bbuild -H. -DXGEN_DIR=$HOME/local/autodesk/maya/plug-ins/xgen/
$ cd build
$ make
```

## How to export XGen spline data from Maya

You can export XGen interactive grooming spline data using `xgmExportSplineDataInternal` mel command.

```
xgmExportSplineDataInternal -output "/path/to/export.xgen" "[description1]_Shape.outRenderData";
```

where `[description1]` will be replaced XGen node(.e.g, if you have `xspline` XGen node, dag name will be `xspline_Shape.outRenderData`

## How to run.

Add `$maya/lib` to `LD_LIBRARY_PATH`, then

```
$ xgen-spline-to-cyhair -i /path/to/export.xgen -o output.cyhair
```

You can control the number of strands(splines) to convert, output withds/uvs.
See details with `--help`


## Optional Workflow

You can optionally convert CyHair data to (extended glTF) format using https://github.com/syoyo/tinygltfloader/tree/master/examples/cyhair_to_gltf

## Features

* [x] Output per-vertex width.
* [x] Output texcoords(as an extension)
* [x] CV repeat(default)

## CV repeat

`--cv_repeat` option.

CV repeat feature will repeat the first and the last CV twice when exporting curve data. This feature is default behavior of xgen-spline-to-cyhair.

This will maintain the last and the last CV position when the curve has been reconstructed as Cubic Bezier curve by interpreting exported CV as b-spline.

See details here:
 
http://www.fundza.com/rman_curves/add_attribute/index.html

## TODO

* [ ] Patch UVs
* [ ] macOS support
* [ ] Windows support
* [ ] RiCurves format export

## LICENSE

MIT license.

### Third party licenses.

* cxxopts.hpp MIT license: https://github.com/jarro2783/cxxopts

## References

* Access interactive grooming spline data using the XGen API https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2017/ENU/Maya/files/GUID-23DD8241-2736-4E3B-AFDB-A77E7E4A4DD6-htm.html
