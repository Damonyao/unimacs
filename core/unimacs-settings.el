;;; unimacs-settings.el --- Emacs Unimacs: emacs setting options.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Set the emacs default setting options.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:


(setq-default
 case-fold-search t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 tooltip-delay 0.5
 fill-column 80
 truncate-lines nil
 truncate-partial-width-windows nil
 ;; no annoying beep on errors
 visible-bell t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t) ; If you change buffer, or focus, disable the current buffer's mark
(global-font-lock-mode t) ; turn on syntax highlighting for all buffers
(setq ring-bell-function (lambda ()))
;; move around lines based on how they are displayed, rather than the actual line.
(setq line-move-visual t)

;; Don't disable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'narrow-to-defun  'disabled nil)
;Ctrl-x Ctrl-u/l to upper/lowercase regions without confirm
(put 'downcase-region  'disabled nil)
(put 'upcase-region    'disabled nil)

;; NO automatic new line when scrolling down at buffer bottom
(setq next-line-add-newlines nil)

(provide 'unimacs-settings)
;;; unimacs-settings.el ends here