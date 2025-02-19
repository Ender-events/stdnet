#  Makefile                                                      -*-makefile-*-
#  ----------------------------------------------------------------------------
# 
#  Copyright (c) 2023 Dietmar Kuehl http://www.dietmar-kuehl.de
# 
#  Licensed under the Apache License Version 2.0 with LLVM Exceptions
#  (the "License"); you may not use this file except in compliance with
#  the License. You may obtain a copy of the License at
# 
#    https://llvm.org/LICENSE.txt
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#  ----------------------------------------------------------------------------

COMPILER = unknown
BUILD    = build/$(COMPILER)
RM       = rm -f
CMAKE_CC = $(CC)
CMAKE_CXX = $(CXX)

.PHONY: default build test distclean clean

default: test

test: build
	./$(BUILD)/test_stdnet

build:
	@mkdir -p $(BUILD)
	cd $(BUILD); cmake ../.. # -DCMAKE_C_COMPILER=$(CMAKE_CC) -DCMAKE_CC_COMPILER=$(CMAKE_CXX)
	cmake --build $(BUILD)

clean:
	$(RM) mkerr olderr *~

distclean: clean
	$(RM) -r $(BUILD)
