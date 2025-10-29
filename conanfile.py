from conan import ConanFile
import os
from conan.tools.cmake import CMake, cmake_layout

class CompressorRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps"

    def requirements(self):
        self.requires("gtest/1.10.0")
        #self.requires("quickfix/1.15.1")
        self.requires("jsoncpp/1.9.6")
        if self.settings.os == "Linux":
            self.requires("base64/0.4.0")

    def build_requirements(self):
        if self.settings.os == "Linux":
            self.tool_requires("cmake/3.27.9")

    def layout(self):
        # We make the assumption that if the compiler is msvc the
        # CMake generator is multi-config
        #multi = True if self.settings.get_safe("compiler") == "gcc" else False
        #if multi:
        #    self.folders.generators = os.path.join("build", "generators")
        #    self.folders.build = "build"
        #else:
        #    self.folders.generators = os.path.join("build", str(self.settings.build_type), "generators")
        #    self.folders.build = os.path.join("build", str(self.settings.build_type))
        cmake_layout(self)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

