CC = g++
PROJECT = calibration
SRC = calibration.cpp
LIBS = `pkg-config --cflags --libs opencv4`
$(PROJECT) : $(SRC)
	 $(CC) $(SRC) -o $(PROJECT) $(LIBS)