(add-to-list 'load-path
             (expand-file-name "lisp/" user-emacs-directory))

(require 'variables)
(require 'packages)    ;; declare packages
(require 'keybindings)
(require 'appearance)  ;; take care of general emacs stuff.
(require 'ui)
(require 'git)
(require 'development)
(require 'completion)
(require 'speed)

(let ((inhibit-message t))
  (message (format "Initialization time: %s"
                 (emacs-init-time))))

(provide 'init)
;;; init.el ends here
