# ApproxDup

![](https://zenodo.org/badge/637791530.svg)

We run ApproxDup on NVIDIA GeForce RTX 3090 platforms.
The GPU driver is 530.30.02.
The NVIDIA Toolkit is CUDA 11.0.
The operating system is Ubuntu 20.04.6.

We compile the CUDA source file to PTX utilizing the NVIDIA front-end compiler, modify the PTX file by inserting error detection (i.e., duplication, error verification, and error notification) instructions, then continue the compilation process with the modified PTX file with the back-end compiler.
By adjusting compile optimization options, we ensure that the modified-PTX generated SASS file preserves the inserted instruction duplication and error detection instructions.

In detail, the usage of the containing files in CUDA/stencils/convolution-2d are as follows:
1. dupinst.sh: The master processing shell.
2. Makefile: The makefile for compiling 2DConvolution.
3. 2DConvolution.cu and 2DConvolution.cuh: The 2D convolution CUDA source code from the Rodinia suite.
4. 2DConvolution.ptx: The PTX file compiled from 2DConvolution.cu.
5. 2DConvolution.sass: We compiled 2DConvolution.ptx to the executable file and then decompiled it to generate 2DConvolution.sass. 
6. 2DConvolution_dup.ptx: We inserted error detection (i.e., duplication, error verification, and error notification) instructions to 2DConvolution.ptx and got 2DConvolution_dup.ptx.
7. 2DConvolution_dup.sass: We continued to compile 2DConvolution_dup.ptx to the executable file and then decompiled it to generate 2DConvolution_dup.sass.

In summary, 2DConvolution.ptx/2DConvolution.sass is the PTX/SASS file without performing instruction duplication, and 2DConvolution_dup.ptx/2DConvolution_dup.sass is the PTX/SASS file after performing instruction duplication. 
