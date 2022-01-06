#
# Copyright (C) 2020 The Falco Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#

set(LYAML_ROOT "${PROJECT_BINARY_DIR}/lyaml-prefix")
set(LYAML_SRC "${LYAML_ROOT}/src/lyaml")
set(LYAML_INSTALL_DIR "${LYAML_ROOT}/install")
set(LYAML_LIB "${LYAML_INSTALL_DIR}/lib/lua/5.1/yaml.a")
set(LYAML_LUA_DIR "${LYAML_INSTALL_DIR}/share/lua/5.1")
message(STATUS "Using bundled lyaml in '${LYAML_SRC}'")
externalproject_add(
  lyaml
  DEPENDS luajit libyaml
  URL "https://github.com/gvvaughan/lyaml/archive/release-v6.0.tar.gz"
  URL_HASH "SHA256=9d7cf74d776999ff6f758c569d5202ff5da1f303c6f4229d3b41f71cd3a3e7a7"
  BUILD_COMMAND ${CMD_MAKE}
  BUILD_IN_SOURCE 1
  BUILD_BYPRODUCTS ${LYAML_LIB}
  INSTALL_DIR ${LYAML_INSTALL_DIR}
  CONFIGURE_COMMAND ./configure --enable-static --prefix=${LYAML_INSTALL_DIR} CFLAGS=-I${LIBYAML_INSTALL_DIR}/include CPPFLAGS=-I${LIBYAML_INSTALL_DIR}/include LDFLAGS=-L${LIBYAML_INSTALL_DIR}/lib LIBS=-lyaml LUA=${LUAJIT_SRC}/luajit LUA_INCLUDE=-I${LUAJIT_INCLUDE}
)
