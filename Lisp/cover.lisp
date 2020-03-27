; create cover images for itch.io

(clear)

(resize 630 500)

(def f 
  (get-frame))

(fill f "black")

(import $path
  (guide 
    (circle 
      (div f:w 2) 
      (div f:h 2) 
      (div f:h 2.5))))