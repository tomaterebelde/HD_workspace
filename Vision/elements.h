#include <stdio.h>
#include <stdlib.h>
#include <string.h>




    typedef struct Position  // Keeps x,y pos of the center of the element
    {
        float x_coor;
        float y_coor; 
    };

    typedef struct Object // Structure for Switches, Buttons, interactive elements
    {
        char name[6];
        Position pos;
    };

    typedef struct ArTag //Structure for ArTags
    {
        char name[6];
        Position pos;
        float width;
    };

    typedef struct PanelA 
    {
        char name[6];
        ArTag artg1, artg2;
        Object switch1, switch2, switch3, switch4;

    };

     typedef struct PanelB1
    {
        char name[6];
        ArTag artg3, artg4, artg5, artg6;
        Object outlet, jumper;

    };

    typedef struct PanelB2
    {
        char name[6];
        ArTag artg7;
        Object ethrnet;

    };




