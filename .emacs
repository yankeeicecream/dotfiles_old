;; Put Autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
;(setq auto-save-file-name-transforms '((".*" "./.saves/\\1" t)))
;(setq backup-directory-alist '((".*" . "~/.saves")))
;(setq auto-save-directory-fallback "$HOME/.saves")

;; create the autosave dir if necessary, since emacs won't.
;(make-directory "./.saves" t)
;;test
;; sdfsdfatain atain save again
;(global-set-key [(control right)] 'forward-word)
;(global-set-key [(control left)] 'backward-word)
(defvar homedir (getenv "HOME"))
(setq debug-on-error t)
(defun make-auto-save-file-name ()
  "Return file name to use for auto-saves of current buffer.."
  (defvar autosv-file-path)
  (defvar autosv-file-name)

  (if (buffer-file-name)
      ; if it is not your emacs non-file buffer
      (progn 
	(setq autosv-file-path (file-name-directory (buffer-file-name)))
	(setq autosv-file-name (file-name-nondirectory (buffer-file-name)))
					; if in homedirectory, then just save it in the local directory
	(if (string-match (regexp-quote homedir) autosv-file-path)
	    (setq autosv-file-path (concat default-directory ".saves/"))
	  (setq autosv-file-path (concat homedir "/.saves" autosv-file-path )))

					; now construct full file name
	(if (not (file-exists-p autosv-file-path))
	    (make-directory autosv-file-path t))
	(concat
	 autosv-file-path
	 "#" 
	 autosv-file-name
	 "#"))
    
    (setq autosv-file-path (concat homedir "/.saves/"))
    (setq autosv-file-name (concat "#" (buffer-name) "#"))
    (if (not (file-exists-p autosv-file-path))
	(make-directory autosv-file-path t))
    (concat   
     autosv-file-path
     autosv-file-name)
    ))


(defun make-backup-file-name (bk-file-name)
  "Return file name to use for backups of current editing file.."
  (defvar bk-file-path)

  (setq bk-file-path (file-name-directory (expand-file-name bk-file-name)))
  (if (string-match (regexp-quote homedir) bk-file-path)
      (setq bk-file-path (concat default-directory ".saves/"))
    (setq bk-file-path (concat homedir "/.saves" bk-file-path )))

  (if (not (file-exists-p bk-file-path))
      (make-directory bk-file-path t))

  (concat bk-file-path (file-name-nondirectory bk-file-name) "~")
;  (defvar bk-dir "~yi/.saves")
  ;(setq backup-directory-alist (list (cons "." bk-dir)))
  ;(setq backup-directory-alist '((cons "." bk-file-path)))    ; don't litter my fs tree
;  (setq backup-directory-alist '((".*" . bk-file-path)))
  )

;(setq backup-directory-alist (list (cons "." "~yi/.saves")))    ; don't litter my fs tree
;(setq
;   backup-by-copying t      ; don't clobber symlinks
;   backup-directory-alist '(("." . '(file-name-directory (buffer-file-name))))    ; don't litter my fs tree
;   delete-old-versions t
;   kept-new-versions 6
;   kept-old-versions 2
;   version-control t)       ; use versioned backups


;(setq bk-dir (file-name-directory (make-auto-save-file-name)))
;(setq backup-directory-alist (file-name-directory (make-auto-save-file-name)))

;(defun make-auto-save-file-name ()
;  "Return file name to use for auto-saves \
;          of current buffer.."
;  (if buffer-file-name
;      (concat bk-dir "#"
;       (file-name-nondirectory buffer-file-name) "#")
;    (concat bk-dir "#" (buffer-name) "#")))

;(expand-file-name (buffer-name))
;(defvar bob (concat bk-dir "#" (buffer-name) "#"))
;(setq backup-directory-alist bk-dir)
;(setq auto-save-file-name-transforms 
;(defvar bob (concat bk-dir (file-name-nondirectory (buffer-auto-save-file-name))))


;    (replace-match (concat homedir "/.saves"))
;    (setq bk-dir (concat default-directory ".saves/"))

