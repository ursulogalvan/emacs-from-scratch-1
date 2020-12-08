(use-package which-key
  :config (which-key-mode))

(use-package evil-easymotion
  :general
  (general-define-key
   :keymaps '(visual operator)
    "j" #'evilem-motion-next-line
    "k" #'evilem-motion-previous-line)
  (general-define-key
   :keymaps '(normal motion)
   "C-j" #'evilem-motion-next-line
   "C-k" #'evilem-motion-previous-line))

(use-package evil-snipe
  :general (general-define-key
	    :keymaps '(normal visual operator)
	    "f" #'evil-snip-f
	    "F" #'evil-snipe-F
	    "t" #'evil-snipe-t
	    "T" #'evil-snipe-T))

(use-package avy
  :general (general-define-key
	    :keymaps '(normal visual motion operator)
	    "C-s" #'evil-avy-goto-char-timer)
  :config
  (setq avy-keys-alist '((avy-goto-char . (?u ?h ?e ?t ?o ?n ?a ?s)))
	avy-keys '(?u ?h ?e ?t ?o ?n ?a ?s)
	avy-enter-times-out t
	avy-timeout-seconds 1
	avy-flyspell-correct-function #'flyspell-correct-at-point)

  (defun my-avy-action-kill-move (pt)
    "Kill sexp at PT and move there."
    (goto-char pt)
    (avy-forward-item)
    (kill-region pt (point))
    (message "Killed: %s" (current-kill 0))
    (point)
    (evil-insert-state))

  (setq avy-dispatch-alist
        '((?c . dc-avy-action-kill-move)
          (?d . avy-action-kill-stay)
          (?g . avy-action-teleport)
          (?m . avy-action-mark)
          (?n . avy-action-copy)
          (?y . avy-action-yank)
          (?i . avy-action-ispell)
          (?z . avy-action-zap-to-char))))

(use-package evil-exchange
  :general (general-nmap "gx" #'evil-exchange))

(use-package ace-window
  :general (general-nmap :prefix "C-w"
	     "C-w" #'ace-window
	     "C-c" #'ace-delete-window)
  :config (setq aw-keys '(?u ?h ?e ?t ?o ?n ?a ?s)
		aw-scope 'frame))

(use-package evil-args
  :general
  (general-define-key
   :keymaps 'evil-inner-text-objects-map
   "a" #'evil-inner-arg)
  (general-define-key
   :keymaps 'evil-outer-text-objects-map
   "a" #'evil-outer-arg))

(use-package evil-lion
  :general
  (general-nvmap
    :prefix "g"
    "l" #'evil-lion-left
    "L" #'evil-lion-right))

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package undo-tree
  :hook ((prog-mode text-mode) . undo-tree-mode)
  :general
  (general-nmap
    "U" #'undo-tree-visualize)
  :config
  (setq undo-tree-visualizer-diff t
        undo-tree-auto-save-history t
        undo-tree-enable-undo-in-region t
        undo-limit 800000
        undo-strong-limit 12000000
        undo-outer-limit 120000000
        undo-tree-history-directory-alist
        `(("." . ,(concat my-cache-dir "undo-tree-hist/")))))

(use-package link-hint
  :general
  (general-nmap
    "C-/" #'link-hint-open-link
    "M-/" #'link-hint-copy-link))

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

(provide 'ui)
