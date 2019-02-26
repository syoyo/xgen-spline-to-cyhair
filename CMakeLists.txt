cmake_minimum_required(VERSION 3.5.1)

project(xgSplineToCyhairConverter)

option(XGEN_DIR "Path to Maya Xgen(Usually /usr/autodesk/maya/plug-ins/xgen for linux")

#set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
#find_package(Sanitizers) # Address sanitizer.

# C++11
set (CMAKE_CXX_STANDARD 11)

include_directories(
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_SOURCE_DIR}/src
    ${XGEN_DIR}/include
)

if (MSVC)
  add_definitions( "-DNOMINMAX" )
endif ()

set (XG_SPLINE_CONVERTER_CORE_SOURCE
    ${CMAKE_SOURCE_DIR}/src/main.cc
    )

link_directories(${XGEN_DIR}/lib)

# point to $maya/lib/ for libclew.so
link_directories(${XGEN_DIR}/../../lib)

# [Executable] 
add_executable (xg-spline-to-cyhair
    ${XG_SPLINE_CONVERTER_CORE_SOURCE}
)

set (XGEN_LIBRARY AdskXGen)
set (MAYA_LIBRARY clew)
  
target_link_libraries(xg-spline-to-cyhair ${XGEN_LIBRARY} ${MAYA_LIBRARY})
