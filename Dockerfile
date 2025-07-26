FROM ubuntu:rolling

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libgtest-dev \
    libboost-system-dev \
    libboost-date-time-dev \
    python3 python3-pip \
    #pipx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project code
COPY . .
WORKDIR /app/
COPY . /app/

# Install conan
RUN pip install conan --break-system-packages --force
RUN ln -s ~/.local/bin/conan /usr/bin/conan
RUN bash -c "conan profile detect"
RUN bash -c "pwd; ls -lrth"
# Build both app and test
RUN conan install . --output-folder=build --build=missing
RUN bash -c "cd build ; source conanbuild.sh"  \
    cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release -j$(nproc) \
    cmake --build . \
RUN bash -c "pwd; ls -lrth; /source/my_app"
CMD ["./source/my_app "]
