FROM ubuntu:22.04

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
#RUN pip install conan --break-system-packages --force
RUN pip install conan
RUN ln -s ~/.local/bin/conan /usr/bin/conan
RUN bash -c "conan profile detect --force"
RUN bash -c "pwd; ls -lrth"
# Build both app and test
RUN conan install . --output-folder=build --build=missing
#RUN conan build .
#RUN bash -c "cd build ; source conanbuild.sh"  \
RUN  cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release -j$(nproc)
RUN  cmake --build . \
RUN bash -c "pwd; ls -lrth"
# ENTRYPOINT ["./build/source/my_app"]
# ENTRYPOINT []
#RUN chmod +x run.sh
#ENTRYPOINT ["./run.sh"]
#CMD [ input.txt ]
#CMD ["1"]
CMD ["echo", "Hello, Darwin"]