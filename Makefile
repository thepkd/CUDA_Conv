# Location of the CUDA Toolkit
CUDA_PATH = /usr/local/cuda
NVCC := $(CUDA_PATH)/bin/nvcc
CCFLAGS := -std=c++11

build: main

main.o:main.cu
	$(NVCC) $(INCLUDES) $(CCFLAGS) $(GENCODE_FLAGS) -o $@ -c $<

main: main.o
	$(NVCC) $(LDFLAGS) $(GENCODE_FLAGS) -o $@ $+ $(LIBRARIES)

run: build
	$(EXEC) ./main

clean:
	rm -f main *.o
