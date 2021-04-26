;; Auto-generated. Do not edit!


(when (boundp 'controller_motors::WheelVelocity)
  (if (not (find-package "CONTROLLER_MOTORS"))
    (make-package "CONTROLLER_MOTORS"))
  (shadow 'WheelVelocity (find-package "CONTROLLER_MOTORS")))
(unless (find-package "CONTROLLER_MOTORS::WHEELVELOCITY")
  (make-package "CONTROLLER_MOTORS::WHEELVELOCITY"))

(in-package "ROS")
;;//! \htmlinclude WheelVelocity.msg.html


(defclass controller_motors::WheelVelocity
  :super ros::object
  :slots (_motor_L_1 _motor_L_2 _motor_L_3 _motor_R_1 _motor_R_2 _motor_R_3 ))

(defmethod controller_motors::WheelVelocity
  (:init
   (&key
    ((:motor_L_1 __motor_L_1) 0.0)
    ((:motor_L_2 __motor_L_2) 0.0)
    ((:motor_L_3 __motor_L_3) 0.0)
    ((:motor_R_1 __motor_R_1) 0.0)
    ((:motor_R_2 __motor_R_2) 0.0)
    ((:motor_R_3 __motor_R_3) 0.0)
    )
   (send-super :init)
   (setq _motor_L_1 (float __motor_L_1))
   (setq _motor_L_2 (float __motor_L_2))
   (setq _motor_L_3 (float __motor_L_3))
   (setq _motor_R_1 (float __motor_R_1))
   (setq _motor_R_2 (float __motor_R_2))
   (setq _motor_R_3 (float __motor_R_3))
   self)
  (:motor_L_1
   (&optional __motor_L_1)
   (if __motor_L_1 (setq _motor_L_1 __motor_L_1)) _motor_L_1)
  (:motor_L_2
   (&optional __motor_L_2)
   (if __motor_L_2 (setq _motor_L_2 __motor_L_2)) _motor_L_2)
  (:motor_L_3
   (&optional __motor_L_3)
   (if __motor_L_3 (setq _motor_L_3 __motor_L_3)) _motor_L_3)
  (:motor_R_1
   (&optional __motor_R_1)
   (if __motor_R_1 (setq _motor_R_1 __motor_R_1)) _motor_R_1)
  (:motor_R_2
   (&optional __motor_R_2)
   (if __motor_R_2 (setq _motor_R_2 __motor_R_2)) _motor_R_2)
  (:motor_R_3
   (&optional __motor_R_3)
   (if __motor_R_3 (setq _motor_R_3 __motor_R_3)) _motor_R_3)
  (:serialization-length
   ()
   (+
    ;; float32 _motor_L_1
    4
    ;; float32 _motor_L_2
    4
    ;; float32 _motor_L_3
    4
    ;; float32 _motor_R_1
    4
    ;; float32 _motor_R_2
    4
    ;; float32 _motor_R_3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _motor_L_1
       (sys::poke _motor_L_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_L_2
       (sys::poke _motor_L_2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_L_3
       (sys::poke _motor_L_3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_R_1
       (sys::poke _motor_R_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_R_2
       (sys::poke _motor_R_2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_R_3
       (sys::poke _motor_R_3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _motor_L_1
     (setq _motor_L_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_L_2
     (setq _motor_L_2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_L_3
     (setq _motor_L_3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_R_1
     (setq _motor_R_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_R_2
     (setq _motor_R_2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_R_3
     (setq _motor_R_3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get controller_motors::WheelVelocity :md5sum-) "2100effca439a60b87f35d4c3f8f6847")
(setf (get controller_motors::WheelVelocity :datatype-) "controller_motors/WheelVelocity")
(setf (get controller_motors::WheelVelocity :definition-)
      "float32 motor_L_1
float32 motor_L_2
float32 motor_L_3
float32 motor_R_1
float32 motor_R_2
float32 motor_R_3

")



(provide :controller_motors/WheelVelocity "2100effca439a60b87f35d4c3f8f6847")


