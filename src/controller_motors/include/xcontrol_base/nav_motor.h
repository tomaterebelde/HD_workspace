#pragma once
#include<epos4_extended.h>

namespace xcontrol {

/** @brief This class is used to add a arm motor on EtherCAT buss
 */
class NavMotor: public Epos4Extended {
public:
    /**
     * @brief Constructor of NavMotor class
     */
    NavMotor(bool has_motor);
};

}