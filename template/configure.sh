#!/usr/bin/env bash

set +e

SCRIPT_FILE=$(readlink -f ${0})
SCRIPT_PATH=$(dirname ${SCRIPT_FILE})

mkdir -p "${SCRIPT_PATH}/Debug"
cd "${SCRIPT_PATH}/Debug"
cmake -G Ninja \
  -D CMAKE_CXX_COMPILER=clang++ \
  -D CMAKE_CXX_FLAGS="-Wall -Wextra -stdlib=libc++ -fno-rtti -fsanitize=address" \
  -D CMAKE_BUILD_TYPE=Debug \
  -D CMAKE_EXPORT_COMPILE_COMMANDS=1 ..

mkdir -p "${SCRIPT_PATH}/Release"
cd "${SCRIPT_PATH}/Release"
cmake -G Ninja \
  -D CMAKE_CXX_COMPILER=clang++ \
  -D CMAKE_CXX_FLAGS="-stdlib=libc++ -fno-rtti -flto=thin -fuse-ld=lld" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_EXPORT_COMPILE_COMMANDS=1 ..
