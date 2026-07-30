(setq get-many-start-exp "[^;]<INSERT-FILE \"")
(setq get-many-end-exp "\"")
(setq get-many-suffix ".zil")

(defun get-many (file) "Get many ZIL files pointed to by a load file."
  (interactive "FFile: ")
  (let (buf)
    (if (setq buf (find-file-noselect file))
	(let ((nfile t) (old-point nil))
	   (switch-to-buffer buf)
	   (setq old-point (point))
	   (goto-char (point-min))
	   (while nfile
	     (setq nfile nil)
	     (if (re-search-forward get-many-start-exp (buffer-size) t)
		 (let ((beg (point)))
		   (if (re-search-forward get-many-end-exp (buffer-size) t)
		       (progn ()
			  (setq nfile
				(concat (downcase (buffer-substring beg (- (point) 1)))
					get-many-suffix))
			  (if (file-exists-p nfile)
			      (progn ()
				     (message (format "Loading '%s'" nfile))
				     (find-file-noselect nfile))
			      (progn ()
				     (message (format "Missing '%s'" nfile))
				     (if (not (yes-or-no-p
					       (concat "Missing '"
						       nfile
						       "' Okay to continue? ")))
				         (error "Load aborted")))))
		       (error "Bad load file '%s'" nfile)))))
	   (goto-char old-point)))))

