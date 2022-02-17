#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "elements.h"

#define Dist1 71
#define Dist2 42
#define Dist3 62
#define Wdth1 50
#define Wdth2 32 


int main(){

// Setup of Panel A

    PanelA PNLA;
    strcpy(PNLA.name,"PNLA");

    strcpy(PNLA.artg1.name, "ARTG1");
    PNLA.artg1.pos.x_coor= Dist2;
    PNLA.artg1.pos.y_coor= Dist1;
    PNLA.artg1.width=Wdth1;

    strcpy(PNLA.artg2.name, "ARTG2");
    PNLA.artg2.pos.x_coor= -Dist2;
    PNLA.artg2.pos.y_coor= 0;
    PNLA.artg2.width=Wdth1;

    strcpy(PNLA.switch1.name, "SWTC1");
    PNLA.switch1.pos.x_coor= -Dist2;
    PNLA.switch1.pos.y_coor= Dist1;

    strcpy(PNLA.switch2.name, "SWTC2");
    PNLA.switch2.pos.x_coor= Dist2;
    PNLA.switch2.pos.y_coor= 0;

    strcpy(PNLA.switch3.name, "SWTC3");
    PNLA.switch3.pos.x_coor= -Dist2;
    PNLA.switch3.pos.y_coor= -Dist1;

    strcpy(PNLA.switch4.name, "SWTC4");
    PNLA.switch4.pos.x_coor= Dist2;
    PNLA.switch4.pos.y_coor= -Dist1;


// Setup of Panel B1

    PanelB1 PNLB1;
    strcpy(PNLB1.name, "PNLB1");

    strcpy(PNLB1.artg3.name, "ARTG3");
    PNLB1.artg3.pos.x_coor= -Dist3;
    PNLB1.artg3.pos.y_coor= Dist1/2.0;
    PNLB1.artg3.width=Wdth2;

    strcpy(PNLB1.artg4.name, "ARTG4");
    PNLB1.artg4.pos.x_coor= Dist3;
    PNLB1.artg4.pos.y_coor= Dist1/2.0;
    PNLB1.artg4.width=Wdth2;

    strcpy(PNLB1.artg5.name, "ARTG5");
    PNLB1.artg5.pos.x_coor= -Dist3;
    PNLB1.artg5.pos.y_coor= -Dist1/2.0;
    PNLB1.artg5.width=Wdth2;

    strcpy(PNLB1.artg6.name, "ARTG6");
    PNLB1.artg6.pos.x_coor= Dist3;
    PNLB1.artg6.pos.y_coor= -Dist1/2.0;
    PNLB1.artg6.width=Wdth2;

    strcpy(PNLB1.outlet.name, "OUTLT");
    PNLB1.outlet.pos.x_coor= 0;
    PNLB1.outlet.pos.y_coor= Dist1/2.0;

    strcpy(PNLB1.jumper.name, "JMPER");
    PNLB1.jumper.pos.x_coor= 0;
    PNLB1.jumper.pos.y_coor= -Dist1/2.0;


// Setup of Panel B2

    PanelB2 PNLB2;

    strcpy(PNLB2.name, "PNLB2");

    strcpy(PNLB2.artg7.name, "ARTG7");
    PNLB2.artg7.pos.x_coor= 0;
    PNLB2.artg7.pos.y_coor= -Dist1/2.0;
    PNLB2.artg7.width=Wdth1;

    strcpy(PNLB2.ethrnet.name, "ETHRN");
    PNLB2.ethrnet.pos.x_coor= 0;
    PNLB2.ethrnet.pos.y_coor= Dist1/2.0;


// Verification prints for Panel A 

    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLA.name, PNLA.artg1.name, PNLA.artg1.pos.x_coor, PNLA.artg1.pos.y_coor, PNLA.artg1.width);
    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLA.name, PNLA.artg2.name, PNLA.artg2.pos.x_coor, PNLA.artg2.pos.y_coor, PNLA.artg2.width);
    printf("%s \n%s \n%f \n%f\n\n", PNLA.name, PNLA.switch1.name, PNLA.switch1.pos.x_coor, PNLA.switch1.pos.y_coor);
    printf("%s \n%s \n%f \n%f\n\n", PNLA.name, PNLA.switch2.name, PNLA.switch2.pos.x_coor, PNLA.switch2.pos.y_coor);
    printf("%s \n%s \n%f \n%f\n\n", PNLA.name, PNLA.switch3.name, PNLA.switch3.pos.x_coor, PNLA.switch3.pos.y_coor);
    printf("%s \n%s \n%f \n%f\n\n", PNLA.name, PNLA.switch4.name, PNLA.switch4.pos.x_coor, PNLA.switch4.pos.y_coor);


// Verification prints for Panel B1

    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLB1.name, PNLB1.artg3.name, PNLB1.artg3.pos.x_coor, PNLB1.artg3.pos.y_coor, PNLB1.artg3.width);
    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLB1.name, PNLB1.artg4.name, PNLB1.artg4.pos.x_coor, PNLB1.artg4.pos.y_coor, PNLB1.artg4.width);
    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLB1.name, PNLB1.artg5.name, PNLB1.artg5.pos.x_coor, PNLB1.artg5.pos.y_coor, PNLB1.artg5.width);
    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLB1.name, PNLB1.artg6.name, PNLB1.artg6.pos.x_coor, PNLB1.artg6.pos.y_coor, PNLB1.artg6.width);
    printf("%s \n%s \n%f \n%f\n\n", PNLB1.name, PNLB1.outlet.name, PNLB1.outlet.pos.x_coor, PNLB1.outlet.pos.y_coor);
    printf("%s \n%s \n%f \n%f\n\n", PNLB1.name, PNLB1.jumper.name, PNLB1.jumper.pos.x_coor, PNLB1.jumper.pos.y_coor);


// Verification prints for Panel B2

    printf("%s \n%s \n%f \n%f \n%f\n\n", PNLB2.name, PNLB2.artg7.name, PNLB2.artg7.pos.x_coor, PNLB2.artg7.pos.y_coor, PNLB2.artg7.width);
    printf("%s \n%s \n%f \n%f\n\n", PNLB2.name, PNLB2.ethrnet.name, PNLB2.ethrnet.pos.x_coor, PNLB2.ethrnet.pos.y_coor);



}