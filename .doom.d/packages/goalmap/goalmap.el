;;; goalmap.el --- Visually mapping goals and subgoals  -*- lexical-binding: t; -*-
;; Author: David Spreekmeester @aapit
;; Keywords: lisp
;; Version: 0.0.1
;; Inspired by Sacha Chua's "Evil Plans"
;;   https://sachachua.com/sharing/evil-plans.html

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package attempts to visualize an Org-mode tree of goals and sub-goals.

;;; Code:

(defun goalmap-build-node-map ()
  "Builds a textual list based on the Org headings in the current buffer"
    (org-map-entries
        (lambda ()
            (let
                (
                  (level (first (org-heading-components)))
                  (name (fifth (org-heading-components)))
                  (tag (sixth (org-heading-components)))
                )
                (format "%s %s"
                    (goalmap-get-heading-stars level)
                    (goalmap-convert-links-to-plaintext name)
                    tag
                )
            )
        )
    )
)

(defun goalmap-get-heading-stars (level)
  "Return (level) number of asterisks to use as Org prefix"
    (let ((output nil))
        (loop repeat level do (setq output (concat output "*")))
        output
    )
)

(defun goalmap-convert-links-to-plaintext (haystack)
  "Converts possibly occuring links in the given string with just their label"
  (let (
        (needle "\\[\\[.+\\]\\[\\(.+\\)\\]\\]")
        (replace "\\1")
      )
    (replace-regexp-in-string needle replace haystack)
  )
)

(defun goalmap-build-plantuml-string (darkmode)
    (let (
          (mindmap-header-darkmode "@startmindmap\nskinparam monochrome reverse\nskinparam shadowing false\nskinparam defaultFontName Monofur Nerd Font\nskinparam roundcorner 20\n\nleft side\n\n")
          (mindmap-header-lightmode "@startmindmap\nskinparam monochrome true\nskinparam shadowing false\nskinparam defaultFontName Monofur Nerd Font\nskinparam roundcorner 20\n\nleft side\n\n")
          (mindmap-footer "@endmindmap")
        )
        (concat
            (if darkmode mindmap-header-darkmode mindmap-header-lightmode)
            (string-join (goalmap-build-node-map) "\n");
            "\n"
            mindmap-footer
        )
    )
)

(defun goalmap-build-vertical-plantuml-string (darkmode)
    (let (
          (mindmap-header-darkmode "@startwbs\nskinparam monochrome reverse\nskinparam shadowing false\nskinparam defaultFontName Monofur Nerd Font\nskinparam roundcorner 20\n\n")
          (mindmap-header-lightmode "@startwbs\nskinparam monochrome true\nskinparam shadowing false\nskinparam defaultFontName Monofur Nerd Font\nskinparam roundcorner 20\n\n")
          (mindmap-footer "@endwbs")
        )
        (concat
            (if darkmode mindmap-header-darkmode mindmap-header-lightmode)
            (string-join (goalmap-build-node-map) "\n");
            "\n"
            mindmap-footer
        )
    )
)

(defun goalmap-mindmap-save (output)
    (let
        (
            (pum "~/Lab/plantuml/generated.pum") ; PlantUML text
            (png "~/Lab/plantuml/generated.png") ; PlantUML img
            (jar "~/Apps/PlantUML/plantuml.jar") ; PlantUML runner
        )
        (write-region output nil pum)
        (shell-command (concat "java -jar " jar " " pum))
        (shell-command (concat "xdg-open " png))
        (message jar)
    )
)

(defun goalmap-create ()
  "Saves and opens a visual Goalmap from the Org-file structure in the current buffer"
  (interactive)
  (goalmap-mindmap-save (goalmap-build-plantuml-string t))
)

(defun goalmap-create-lightmode ()
  "Saves and opens a visual Goalmap from the Org-file structure in the current buffer"
  (interactive)
  (goalmap-mindmap-save (goalmap-build-plantuml-string nil))
)

(defun goalmap-create-darkmode ()
  "Saves and opens a visual Goalmap from the Org-file structure in the current buffer"
  (interactive)
  (goalmap-mindmap-save (goalmap-build-plantuml-string t))
)

(defun goalmap-create-vertical ()
  "Saves and opens a visual Goalmap from the Org-file structure in the current buffer"
  (interactive)
  (goalmap-mindmap-save (goalmap-build-vertical-plantuml-string t))
)

(provide 'goalmap)
;;; goalmap.el ends here
