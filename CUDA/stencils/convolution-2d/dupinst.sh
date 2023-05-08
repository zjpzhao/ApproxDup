make clean
make all
cuobjdump -sass 2DConvolution > 2DConvolution.sass
rm -f 2DConvolution

ptxas -arch=sm_35 -m64 -O0  "2DConvolution_dup.ptx"  -o "2DConvolution.sm_35.cubin" 
fatbinary --create="2DConvolution.fatbin" -64 --cmdline="-O0  " --cicc-cmdline="-ftz=0 -prec_div=1 -prec_sqrt=1 -fmad=1 " "--image3=kind=elf,sm=35,file=2DConvolution.sm_35.cubin" "--image3=kind=ptx,sm=35,file=2DConvolution.ptx" --embedded-fatbin="2DConvolution.fatbin.c" 
gcc -E -x c++ -D__CUDACC__ -D__NVCC__  -I"../../utilities" "-I/usr/local/cuda/bin/../targets/x86_64-linux/include"    -D__CUDACC_VER_MAJOR__=11 -D__CUDACC_VER_MINOR__=1 -D__CUDACC_VER_BUILD__=74 -D__CUDA_API_VER_MAJOR__=11 -D__CUDA_API_VER_MINOR__=1 -include "cuda_runtime.h" -m64 "2DConvolution.cu" -o "2DConvolution.cpp4.ii" 
cudafe++ --c++14 --gnu_version=90500 --orig_src_file_name "2DConvolution.cu" --allow_managed  --m64 --parse_templates --gen_c_file_name "2DConvolution.cudafe1.cpp" --stub_file_name "2DConvolution.cudafe1.stub.c" --module_id_file_name "2DConvolution.module_id" "2DConvolution.cpp4.ii" 
gcc -D__CUDA_ARCH__=350 -c -x c++  -DCUDA_DOUBLE_MATH_FUNCTIONS -I"../../utilities" "-I/usr/local/cuda/bin/../targets/x86_64-linux/include"   -m64 "2DConvolution.cudafe1.cpp" -o "2DConvolution.o" 
nvlink --arch=sm_35 --register-link-binaries="2DConvolution_dlink.reg.c"  -m64   "-L/usr/local/cuda/bin/../targets/x86_64-linux/lib/stubs" "-L/usr/local/cuda/bin/../targets/x86_64-linux/lib" -cpu-arch=X86_64 "2DConvolution.o"  -lcudadevrt  -o "2DConvolution_dlink.sm_35.cubin"
fatbinary --create="2DConvolution_dlink.fatbin" -64 --cmdline="-O0  " --cicc-cmdline="-ftz=0 -prec_div=1 -prec_sqrt=1 -fmad=1 " -link "--image3=kind=elf,sm=35,file=2DConvolution_dlink.sm_35.cubin" --embedded-fatbin="2DConvolution_dlink.fatbin.c" 
gcc -c -x c++ -DFATBINFILE="\"2DConvolution_dlink.fatbin.c\"" -DREGISTERLINKBINARYFILE="\"2DConvolution_dlink.reg.c\"" -I. -D__NV_EXTRA_INITIALIZATION= -D__NV_EXTRA_FINALIZATION= -D__CUDA_INCLUDE_COMPILER_INTERNAL_HEADERS__  -I"../../utilities" "-I/usr/local/cuda/bin/../targets/x86_64-linux/include"    -D__CUDACC_VER_MAJOR__=11 -D__CUDACC_VER_MINOR__=1 -D__CUDACC_VER_BUILD__=74 -D__CUDA_API_VER_MAJOR__=11 -D__CUDA_API_VER_MINOR__=1 -m64 "/usr/local/cuda/bin/crt/link.stub" -o "2DConvolution_dlink.o" 
g++ -m64 -Wl,--start-group "2DConvolution_dlink.o" "2DConvolution.o"   "-L/usr/local/cuda/bin/../targets/x86_64-linux/lib/stubs" "-L/usr/local/cuda/bin/../targets/x86_64-linux/lib"  -lcudadevrt  -lcudart_static  -lrt -lpthread  -ldl  -Wl,--end-group -o "2DConvolution_dup" 

cuobjdump -sass 2DConvolution_dup > 2DConvolution_dup.sass
cp ./2DConvolution_dup.ptx ./2DConvolution_dup.sass ./2DConvolution.ptx ./2DConvolution.sass ../../../../results
rm -f 2DConvolution_dup
make clean

