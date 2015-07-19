;;; This code is written by Mikko Vanhatalo <mv@exilis.xyz> and placed in
;;; the Public Domain. All warranties are disclaimed.

(module stb-image (stbi-load stbi-free)

(import chicken scheme foreign)

(foreign-declare "#define STB_IMAGE_IMPLEMENTATION")
(foreign-declare "#include \"stb_image.h\"")

(define %%stbi-load
  (foreign-lambda (c-pointer unsigned-byte)
                  "stbi_load"
                  c-string
                  (c-pointer int)
                  (c-pointer int)
                  (c-pointer int)
                  int))

(define (stbi-load path #!optional (req-comp 0))
  (let-location ((x int)
                 (y int)
                 (comp int))
    (let ((data (%%stbi-load path #$x #$y #$comp req-comp)))
      (list data x y comp))))

(define stbi-free
  (foreign-lambda void
                  "stbi_image_free"
                  (c-pointer unsigned-byte)))

)
