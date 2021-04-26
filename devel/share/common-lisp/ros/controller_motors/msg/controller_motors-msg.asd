
(cl:in-package :asdf)

(defsystem "controller_motors-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "WheelVelocity" :depends-on ("_package_WheelVelocity"))
    (:file "_package_WheelVelocity" :depends-on ("_package"))
  ))