
(cl:in-package :asdf)

(defsystem "hd_controller_motors-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HandlingControl" :depends-on ("_package_HandlingControl"))
    (:file "_package_HandlingControl" :depends-on ("_package"))
  ))