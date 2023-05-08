all:
	nvcc -O0 -Xptxas -O0 ${CUFILES} -I ${PATH_TO_UTILS} -o ${EXECUTABLE} -arch=sm_35 --keep
dryrun:
	nvcc -O0 -Xptxas -O0 -dryrun -arch=sm_35 ${CUFILES} -I ${PATH_TO_UTILS} -o ${EXECUTABLE} --keep 2>dryrun.out

clean:
	rm -f *~ ${EXECUTABLE} *.ii *.i *.gpu *.fatbin *.hash *.o *.cubin *.module_id *.exe *.c *.cpp
	rm -f 2DConvolution1 2DConvolution_dup 2DConvolution_dup_without_load

# clobber:
# 	rm -f *~ ${EXECUTABLE} *.ii *.i *.gpu *.fatbin *.hash *.o *.cubin *.module_id *.exe *.c *.cpp
# 	rm -f 2DConvolution1 2DConvolution_dup 2DConvolution_dup_without_load
# 	rm -f *.out  *.ptx *.sass