CC = g++
PROJECT = marker_creation
SRC = marker_creation.cpp
LIBS = `pkg-config --cflags --libs opencv4`
$(PROJECT) : $(SRC)
	 $(CC) $(SRC) -o $(PROJECT) $(LIBS)