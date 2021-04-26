// Auto-generated. Do not edit!

// (in-package controller_motors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class WheelVelocity {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_L_1 = null;
      this.motor_L_2 = null;
      this.motor_L_3 = null;
      this.motor_R_1 = null;
      this.motor_R_2 = null;
      this.motor_R_3 = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_L_1')) {
        this.motor_L_1 = initObj.motor_L_1
      }
      else {
        this.motor_L_1 = 0.0;
      }
      if (initObj.hasOwnProperty('motor_L_2')) {
        this.motor_L_2 = initObj.motor_L_2
      }
      else {
        this.motor_L_2 = 0.0;
      }
      if (initObj.hasOwnProperty('motor_L_3')) {
        this.motor_L_3 = initObj.motor_L_3
      }
      else {
        this.motor_L_3 = 0.0;
      }
      if (initObj.hasOwnProperty('motor_R_1')) {
        this.motor_R_1 = initObj.motor_R_1
      }
      else {
        this.motor_R_1 = 0.0;
      }
      if (initObj.hasOwnProperty('motor_R_2')) {
        this.motor_R_2 = initObj.motor_R_2
      }
      else {
        this.motor_R_2 = 0.0;
      }
      if (initObj.hasOwnProperty('motor_R_3')) {
        this.motor_R_3 = initObj.motor_R_3
      }
      else {
        this.motor_R_3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WheelVelocity
    // Serialize message field [motor_L_1]
    bufferOffset = _serializer.float32(obj.motor_L_1, buffer, bufferOffset);
    // Serialize message field [motor_L_2]
    bufferOffset = _serializer.float32(obj.motor_L_2, buffer, bufferOffset);
    // Serialize message field [motor_L_3]
    bufferOffset = _serializer.float32(obj.motor_L_3, buffer, bufferOffset);
    // Serialize message field [motor_R_1]
    bufferOffset = _serializer.float32(obj.motor_R_1, buffer, bufferOffset);
    // Serialize message field [motor_R_2]
    bufferOffset = _serializer.float32(obj.motor_R_2, buffer, bufferOffset);
    // Serialize message field [motor_R_3]
    bufferOffset = _serializer.float32(obj.motor_R_3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WheelVelocity
    let len;
    let data = new WheelVelocity(null);
    // Deserialize message field [motor_L_1]
    data.motor_L_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motor_L_2]
    data.motor_L_2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motor_L_3]
    data.motor_L_3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motor_R_1]
    data.motor_R_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motor_R_2]
    data.motor_R_2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motor_R_3]
    data.motor_R_3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'controller_motors/WheelVelocity';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2100effca439a60b87f35d4c3f8f6847';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 motor_L_1
    float32 motor_L_2
    float32 motor_L_3
    float32 motor_R_1
    float32 motor_R_2
    float32 motor_R_3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WheelVelocity(null);
    if (msg.motor_L_1 !== undefined) {
      resolved.motor_L_1 = msg.motor_L_1;
    }
    else {
      resolved.motor_L_1 = 0.0
    }

    if (msg.motor_L_2 !== undefined) {
      resolved.motor_L_2 = msg.motor_L_2;
    }
    else {
      resolved.motor_L_2 = 0.0
    }

    if (msg.motor_L_3 !== undefined) {
      resolved.motor_L_3 = msg.motor_L_3;
    }
    else {
      resolved.motor_L_3 = 0.0
    }

    if (msg.motor_R_1 !== undefined) {
      resolved.motor_R_1 = msg.motor_R_1;
    }
    else {
      resolved.motor_R_1 = 0.0
    }

    if (msg.motor_R_2 !== undefined) {
      resolved.motor_R_2 = msg.motor_R_2;
    }
    else {
      resolved.motor_R_2 = 0.0
    }

    if (msg.motor_R_3 !== undefined) {
      resolved.motor_R_3 = msg.motor_R_3;
    }
    else {
      resolved.motor_R_3 = 0.0
    }

    return resolved;
    }
};

module.exports = WheelVelocity;
