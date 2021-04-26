; Auto-generated. Do not edit!


(cl:in-package controller_motors-msg)


;//! \htmlinclude WheelVelocity.msg.html

(cl:defclass <WheelVelocity> (roslisp-msg-protocol:ros-message)
  ((motor_L_1
    :reader motor_L_1
    :initarg :motor_L_1
    :type cl:float
    :initform 0.0)
   (motor_L_2
    :reader motor_L_2
    :initarg :motor_L_2
    :type cl:float
    :initform 0.0)
   (motor_L_3
    :reader motor_L_3
    :initarg :motor_L_3
    :type cl:float
    :initform 0.0)
   (motor_R_1
    :reader motor_R_1
    :initarg :motor_R_1
    :type cl:float
    :initform 0.0)
   (motor_R_2
    :reader motor_R_2
    :initarg :motor_R_2
    :type cl:float
    :initform 0.0)
   (motor_R_3
    :reader motor_R_3
    :initarg :motor_R_3
    :type cl:float
    :initform 0.0))
)

(cl:defclass WheelVelocity (<WheelVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WheelVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WheelVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controller_motors-msg:<WheelVelocity> is deprecated: use controller_motors-msg:WheelVelocity instead.")))

(cl:ensure-generic-function 'motor_L_1-val :lambda-list '(m))
(cl:defmethod motor_L_1-val ((m <WheelVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_motors-msg:motor_L_1-val is deprecated.  Use controller_motors-msg:motor_L_1 instead.")
  (motor_L_1 m))

(cl:ensure-generic-function 'motor_L_2-val :lambda-list '(m))
(cl:defmethod motor_L_2-val ((m <WheelVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_motors-msg:motor_L_2-val is deprecated.  Use controller_motors-msg:motor_L_2 instead.")
  (motor_L_2 m))

(cl:ensure-generic-function 'motor_L_3-val :lambda-list '(m))
(cl:defmethod motor_L_3-val ((m <WheelVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_motors-msg:motor_L_3-val is deprecated.  Use controller_motors-msg:motor_L_3 instead.")
  (motor_L_3 m))

(cl:ensure-generic-function 'motor_R_1-val :lambda-list '(m))
(cl:defmethod motor_R_1-val ((m <WheelVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_motors-msg:motor_R_1-val is deprecated.  Use controller_motors-msg:motor_R_1 instead.")
  (motor_R_1 m))

(cl:ensure-generic-function 'motor_R_2-val :lambda-list '(m))
(cl:defmethod motor_R_2-val ((m <WheelVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_motors-msg:motor_R_2-val is deprecated.  Use controller_motors-msg:motor_R_2 instead.")
  (motor_R_2 m))

(cl:ensure-generic-function 'motor_R_3-val :lambda-list '(m))
(cl:defmethod motor_R_3-val ((m <WheelVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_motors-msg:motor_R_3-val is deprecated.  Use controller_motors-msg:motor_R_3 instead.")
  (motor_R_3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WheelVelocity>) ostream)
  "Serializes a message object of type '<WheelVelocity>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_L_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_L_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_L_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_R_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_R_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_R_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WheelVelocity>) istream)
  "Deserializes a message object of type '<WheelVelocity>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_L_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_L_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_L_3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_R_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_R_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_R_3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WheelVelocity>)))
  "Returns string type for a message object of type '<WheelVelocity>"
  "controller_motors/WheelVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WheelVelocity)))
  "Returns string type for a message object of type 'WheelVelocity"
  "controller_motors/WheelVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WheelVelocity>)))
  "Returns md5sum for a message object of type '<WheelVelocity>"
  "2100effca439a60b87f35d4c3f8f6847")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WheelVelocity)))
  "Returns md5sum for a message object of type 'WheelVelocity"
  "2100effca439a60b87f35d4c3f8f6847")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WheelVelocity>)))
  "Returns full string definition for message of type '<WheelVelocity>"
  (cl:format cl:nil "float32 motor_L_1~%float32 motor_L_2~%float32 motor_L_3~%float32 motor_R_1~%float32 motor_R_2~%float32 motor_R_3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WheelVelocity)))
  "Returns full string definition for message of type 'WheelVelocity"
  (cl:format cl:nil "float32 motor_L_1~%float32 motor_L_2~%float32 motor_L_3~%float32 motor_R_1~%float32 motor_R_2~%float32 motor_R_3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WheelVelocity>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WheelVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'WheelVelocity
    (cl:cons ':motor_L_1 (motor_L_1 msg))
    (cl:cons ':motor_L_2 (motor_L_2 msg))
    (cl:cons ':motor_L_3 (motor_L_3 msg))
    (cl:cons ':motor_R_1 (motor_R_1 msg))
    (cl:cons ':motor_R_2 (motor_R_2 msg))
    (cl:cons ':motor_R_3 (motor_R_3 msg))
))
