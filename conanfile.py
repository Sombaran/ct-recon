from conan import ConanFile
import os
from conan.tools.cmake import CMake, cmake_layout

class CompressorRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps"

    def requirements(self):
        #self.requires("quickfix/1.15.1")
        #self.requires("websocketpp/0.8.2")
        self.requires("boost/1.47.0")
        self.requires("gtest/1.10.0")
        self.requires("jsoncpp/1.9.6")

        if self.settings.os == "Linux":
            self.requires("base64/0.4.0")

    def build_requirements(self):
        if self.settings.os == "Linux":
            self.tool_requires("cmake/3.27.9")

    def layout(self):
        cmake_layout(self)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

