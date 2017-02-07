CXX = g++ -std=c++11
CXXFLAGS = -O3 -pedantic -Wall -march=native
#CXXFLAGS = -g -D_GLIBCXX_DEBUG
CXXFLAGS_OMP = $(CXXFLAGS) -fopenmp -Ilodepng
LIBS = -lpthread -lm
LIBS_OMP = -lm

all: Concurrency.exe NonAffinite.exe  OneThreadPerNode.exe Mandelbrot.exe MandelbrotMultithreaded.exe  \
ParallelRegionOpenMP_1.exe ParallelRegionOpenMP_2.exe ParallelRegionOpenMP_3.exe ParallelRegionOpenMP_fct1.exe \
ParallelRegionOpenMP_fct2.exe ParallelRegionOpenMP_dynalloc.exe ParallelRegionOpenMP_reduction.exe \
ParallelRegionOpenMP_loopreduction.exe ParallelRegionOpenMP_sections.exe ParallelRegionOpenMP_single.exe \
ParallelRegionOpenMP_master.exe MandelbrotOpenMP.exe  MandelbrotTBB.exe

Concurrency.exe:	Concurrency.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

NonAffinite.exe:	NonAffinite.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

OneThreadPerNode.exe:	OneThreadPerNode.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

Mandelbrot.exe:	Mandelbrot.cpp lodepng/lodepng.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)


MandelbrotMultithreaded.exe:	MandelbrotMultithreaded.cpp lodepng/lodepng.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

MandelbrotOpenMP.exe:	MandelbrotOpenMP.cpp lodepng/lodepng.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_1.exe:	ParallelRegionOpenMP_1.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_2.exe:	ParallelRegionOpenMP_2.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_3.exe:	ParallelRegionOpenMP_3.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_fct1.exe:	ParallelRegionOpenMP_fct1.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_fct2.exe:	ParallelRegionOpenMP_fct2.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_dynalloc.exe:	ParallelRegionOpenMP_dynalloc.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_reduction.exe:	ParallelRegionOpenMP_reduction.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_loopreduction.exe:	ParallelRegionOpenMP_loopreduction.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_sections.exe:	ParallelRegionOpenMP_sections.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_single.exe:	ParallelRegionOpenMP_single.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

ParallelRegionOpenMP_master.exe:	ParallelRegionOpenMP_master.cpp
	$(CXX) $(CXXFLAGS_OMP) -o $@ $^ $(LIBS_OMP)

MandelbrotTBB.exe:	MandelbrotTBB.cpp lodepng/lodepng.cpp
	$(CXX) $(CXXFLAGS_OMP) -std=c++14  -o $@ $^ $(LIBS_OMP) -ltbb


clean:
	@rm -fr *.exe *~ *.o *.png
