; Auto-generated. Do not edit!


(cl:in-package xplore_msg-msg)


;//! \htmlinclude HandlingControl.msg.html

(cl:defclass <HandlingControl> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:boolean
    :initform cl:nil)
   (active
    :reader active
    :initarg :active
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 7 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass HandlingControl (<HandlingControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandlingControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandlingControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xplore_msg-msg:<HandlingControl> is deprecated: use xplore_msg-msg:HandlingControl instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <HandlingControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xplore_msg-msg:mode-val is deprecated.  Use xplore_msg-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'active-val :lambda-list '(m))
(cl:defmethod active-val ((m <HandlingControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xplore_msg-msg:active-val is deprecated.  Use xplore_msg-msg:active instead.")
  (active m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandlingControl>) ostream)
  "Serializes a message object of type '<HandlingControl>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mode) 1 0)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'active))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandlingControl>) istream)
  "Deserializes a message object of type '<HandlingControl>"
    (cl:setf (cl:slot-value msg 'mode) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'active) (cl:make-array 7))
  (cl:let ((vals (cl:slot-value msg 'active)))
    (cl:dotimes (i 7)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandlingControl>)))
  "Returns string type for a message object of type '<HandlingControl>"
  "xplore_msg/HandlingControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandlingControl)))
  "Returns string type for a message object of type 'HandlingControl"
  "xplore_msg/HandlingControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandlingControl>)))
  "Returns md5sum for a message object of type '<HandlingControl>"
  "9d442959eb4fb33de16d25940179fe7d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandlingControl)))
  "Returns md5sum for a message object of type 'HandlingControl"
  "9d442959eb4fb33de16d25940179fe7d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandlingControl>)))
  "Returns full string definition for message of type '<HandlingControl>"
  (cl:format cl:nil "bool mode~%int8[7] active~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandlingControl)))
  "Returns full string definition for message of type 'HandlingControl"
  (cl:format cl:nil "bool mode~%int8[7] active~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandlingControl>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'active) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandlingControl>))
  "Converts a ROS message object to a list"
  (cl:list 'HandlingControl
    (cl:cons ':mode (mode msg))
    (cl:cons ':active (active msg))
))
