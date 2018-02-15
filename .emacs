;; https://github.com/mooz/js2-mode/
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default indent-tabs-mode nil)
(defun my-js2-mode-vars ()
  (setq js2-basic-offset 2)
  (js2-mode-show-strict-warnings nil)
  )

(add-hook 'js2-mode-hook 'my-js2-mode-vars)

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq line-move-visual nil)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat "%" (number-to-string w) "d ")))
    ad-do-it))
(global-linum-mode 1)

;; Excerpted from https://github.com/nileshk/emacs/blob/master/startup.el
;; Turn off the default backup behaviour
;; Instead, save backups to ~/.emacs.d/backup (creating folder if necessary)
(let ((backup-dir "~/.emacs.d/backup"))
  '(progn
     (if (not (file-directory-p backup-dir))
	 '(progn
	    (message (concat "Creating directory: " backup-dir))
	    (make-directory backup-dir))))
  (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))))
