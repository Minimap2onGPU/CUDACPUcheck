PROJECTFILE = $(or $(wildcard assignment*.cu $(EXECUTABLE).cu main.cu), starter.cu)
EXECUTABLE = device_check
all: run

run: build
	@./$(EXECUTABLE)

$(EXECUTABLE): $(PROJECTFILE)
	@nvcc $< -o $@ -std=c++11
	@echo "Successfully built $@"

build: $(EXECUTABLE)
clean:
	rm -f $(EXECUTABLE)

export MAKEFILE_HELP

help:
	@echo "$$MAKEFILE_HELP"
