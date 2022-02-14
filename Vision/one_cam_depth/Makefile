CC = g++
PROJECT = main
##PROJECT = polyfit
SRC = main.cpp
##SRC = polyfit_generator.cpp
LIBS = `pkg-config --cflags --libs opencv4`
$(PROJECT) : $(SRC)
	 $(CC) $(SRC) -o $(PROJECT) $(LIBS)