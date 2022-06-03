//@@ The purpose of this code is to become familiar with the submission
//@@ process. Do not worry if you do not understand all the details of
//@@ the code.
#include <stdio.h>

int main(int argc, char **argv) {
  int deviceCount;

  cudaGetDeviceCount(&deviceCount);
  printf("Device Count %d\n", deviceCount);

  for (int dev = 0; dev < deviceCount; dev++) {
    cudaDeviceProp deviceProp;

    cudaGetDeviceProperties(&deviceProp, dev);

    if (dev == 0) {
      if (deviceProp.major == 9999 && deviceProp.minor == 9999) {
        printf("No CUDA GPU has been detected\n");
        return -1;
      } else if (deviceCount == 1) {
        //@@ WbLog is a provided logging API (similar to Log4J).
        //@@ The logging function wbLog takes a level which is either
        //@@ OFF, FATAL, ERROR, WARN, INFO, DEBUG, or TRACE and a
        //@@ message to be printed.
        printf("There is 1 device supporting CUDA\n");
      } else {
        printf("There are %d devices supporting CUDA\n", deviceCount);
      }
    }

    printf("Device %d  name: %s\n", dev, deviceProp.name);
   // wbLog(TRACE, " Computational Capabilities: ", deviceProp.major, ".",
   //       deviceProp.minor);
    printf(" Maximum global memory size: %lu\n",deviceProp.totalGlobalMem);
    printf(" Maximum constant memory size: %lu\n", deviceProp.totalConstMem);
    printf(" Maximum shared memory size per block: %lu\n", deviceProp.sharedMemPerBlock);
    printf(" Maximum block dimensions: %d x %d x %d\n", deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1], deviceProp.maxThreadsDim[2]);
    printf(" Maximum grid dimensions: %d x %d x %d\n", deviceProp.maxGridSize[0], deviceProp.maxGridSize[1], deviceProp.maxGridSize[2]);
    printf(" Warp size: %d\n", deviceProp.warpSize);
  }

  return 0;
}
