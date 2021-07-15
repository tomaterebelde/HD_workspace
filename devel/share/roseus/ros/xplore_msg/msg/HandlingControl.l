;; Auto-generated. Do not edit!


(when (boundp 'xplore_msg::HandlingControl)
  (if (not (find-package "XPLORE_MSG"))
    (make-package "XPLORE_MSG"))
  (shadow 'HandlingControl (find-package "XPLORE_MSG")))
(unless (find-package "XPLORE_MSG::HANDLINGCONTROL")
  (make-package "XPLORE_MSG::HANDLINGCONTROL"))

(in-package "ROS")
;;//! \htmlinclude HandlingControl.msg.html


(defclass xplore_msg::HandlingControl
  :super ros::object
  :slots (_mode _active ))

(defmethod xplore_msg::HandlingControl
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

(setf (get xplore_msg::HandlingControl :md5sum-) "9d442959eb4fb33de16d25940179fe7d")
(setf (get xplore_msg::HandlingControl :datatype-) "xplore_msg/HandlingControl")
(setf (get xplore_msg::HandlingControl :definition-)
      "bool mode
int8[7] active
")



(provide :xplore_msg/HandlingControl "9d442959eb4fb33de16d25940179fe7d")


