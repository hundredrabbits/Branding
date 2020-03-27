; 100R Splash

(clear)
(resize 1920 1080)
(def f 
  (get-frame))

; fill

(fill f "white")

; add center guide

(guide 
  (line 
    (div f:w 2) 0 
    (div f:w 2) f:h))

; draw image

(guide 
  (import $path
    (rect 
      (sub 
        (div f:w 2) 400) 75 800 800)))

; draw text

(fill 
  (text 
    (div f:w 2) 850 "bold 80" "Support us on Patreon " "center" "Alte Haas Grotesk") "black")

; export

(export "splash")