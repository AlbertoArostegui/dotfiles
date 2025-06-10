(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   '(company-dabbrev-code company-semantic company-cmake company-capf
                          company-clang company-files
                          (company-dabbrev-code company-gtags
                                                company-etags
                                                company-keywords)
                          company-oddmuse company-dabbrev))
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("b4b5da90759ab14719f1e1d8d0138ff72d2901e8a63748b172944627513cfffb"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(evil-undo-system 'undo-tree)
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(amx cider clojure-mode company counsel diff-hl evil evil-collection
         gruber-darker-theme haskell-mode helpful magit mood-line
         slime smooth-scroll smooth-scrolling timu-macos-theme
         undo-tree vterm vterm-toggle))
 '(verilog-auto-lineup 'ignore)
 '(verilog-auto-newline nil)
 '(verilog-case-indent 4)
 '(verilog-cexp-indent 4)
 '(verilog-indent-level 4)
 '(verilog-indent-level-behavioral 4)
 '(verilog-indent-level-declaration 4)
 '(verilog-indent-level-module 4)
 '(whitespace-action '(auto-cleanup)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-blue ((t (:background "dodger blue" :foreground "dodger blue"))))
 '(mode-line-active ((t (:inherit mode-line :box (:line-width (1 . 1) :color "gold" :style released-button))))))
(set-face-attribute 'default nil :height 130)
