;; Auto-generated. Do not edit!


(when (boundp 'hd_controller_motors::HandlingControl)
  (if (not (find-package "HD_CONTROLLER_MOTORS"))
    (make-package "HD_CONTROLLER_MOTORS"))
  (shadow 'HandlingControl (find-package "HD_CONTROLLER_MOTORS")))
(unless (find-package "HD_CONTROLLER_MOTORS::HANDLINGCONTROL")
  (make-package "HD_CONTROLLER_MOTORS::HANDLINGCONTROL"))

(in-package "ROS")
;;//! \htmlinclude HandlingControl.msg.html


(defclass hd_controller_motors::HandlingControl
  :super ros::object
  :slots (_mode _active ))

(defmethod hd_controller_motors::HandlingControl
  (:init
   (&key
    ((:mode __mode) nil)
    ((:active __active) (make-array 7 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _mode __mode)
   (setq _active __active)
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:active
   (&optional __active)
   (if __active (setq _active __active)) _active)
  (:serialization-length
   ()
   (+
    ;; bool _mode
    1
    ;; int8[7] _active
    (* 1    7)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _mode
       (if _mode (write-byte -1 s) (write-byte 0 s))
     ;; int8[7] _active
     (dotimes (i 7)
       (write-byte (elt _active i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _mode
     (setq _mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8[7] _active
   (dotimes (i (length _active))
     (setf (elt _active i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _active i) 127) (setf (elt _active i) (- (elt _active i) 256)))
     )
   ;;
   self)
  )

(setf (get hd_controller_motors::HandlingControl :md5sum-) "9d442959eb4fb33de16d25940179fe7d")
(setf (get hd_controller_motors::HandlingControl :datatype-) "hd_controller_motors/HandlingControl")
(setf (get hd_controller_motors::HandlingControl :definition-)
      "bool mode
int8[7] active
")



(provide :hd_controller_motors/HandlingControl "9d442959eb4fb33de16d25940179fe7d")


