cmake_minimum_required(VERSION 3.16)

project(FusionScale LANGUAGES C CXX)

add_library(fusionscale INTERFACE)

target_include_directories(fusionscale
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)
