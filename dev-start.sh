# Builds and runs a dev environment container allowing compiling of EveMu
docker build -t evemu -f dev.Dockerfile .;

docker run -it \
  --mount type=bind,source=./CMakeLists.txt,target=/src/CMakeLists.txt \
  --mount type=bind,source=./config.h.in,target=/src/config.h.in \
  --mount type=bind,source=./cmake,target=/src/cmake \
  --mount type=bind,source=./dep,target=/src/dep\
  --mount type=bind,source=./src,target=/src/src \
  --mount type=bind,source=./utils,target=/src/utils\
  evemu bash;
