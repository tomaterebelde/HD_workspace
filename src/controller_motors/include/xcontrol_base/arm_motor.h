#pragma once
#include<epos4_extended.h>

namespace xcontrol {

/** @brief This class is used to add a arm motor on EtherCAT buss
 */
class ArmMotor: public Epos4Extended {
public:
    /**
     * @brief Constructor of ArmMotor class
     */
    ArmMotor(bool has_motor);
};

}