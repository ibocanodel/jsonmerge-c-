all: configure build test

configure:
	cmake \
		-S . \
		-B build \
		-DCMAKE_BUILD_TYPE=RELEASE
	
build:
	cmake --build build

test:
	cmake --build build --target test

.PHONY: all build configure
