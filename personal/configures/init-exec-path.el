;;; init-exec-path.el --- Summary
;;; Commentary:
;; comments

;;; Code:
(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))
  :config
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO"))
    (add-to-list 'exec-path-from-shell-variables var))
  (setq unimacs-extra-bin-dir (expand-file-name "extra-bins" unimacs-utils-dir))
  (cond
   (*win32*
    ;; setting emacs bin dir
    (let ((emacs-bin-dir (expand-file-name "../../../../bin" exec-directory)))
      (setenv "PATH" (concat (replace-regexp-in-string "\/" "\\\\" emacs-bin-dir)
                             ";" (getenv "PATH")))
      (add-to-list 'exec-path emacs-bin-dir))

    ;; setting extra bin dir
    (let ((paths '("Aspell" "glo651wb" "ctags5.8" "irony" "msys64")))
      (dolist (path paths)
        (let ((full-path (expand-file-name (concat path "/bin")
                                           unimacs-extra-bin-dir)))
          (setenv "PATH" (concat (replace-regexp-in-string "\/" "\\\\" full-path)
                                 ";" (getenv "PATH")))
          (add-to-list 'exec-path full-path))))

    ;; setting gtags
    (setenv "GTAGSCONF" (expand-file-name "glo651wb/share/gtags/gtags.conf"
                                          unimacs-extra-bin-dir)))
   (*is-a-mac*
    (setenv "PATH" (concat "/usr/local/texlive/2014/bin/universal-darwin:"
                           (getenv "PATH")))
    (add-to-list 'exec-path "/usr/local/texlive/2014/bin/universal-darwin")
    ))
  )

(provide 'init-exec-path)
;;; init-exec-path.el ends here
