# stb-image

## Description
CHICKEN Scheme egg for [stb_image](https://github.com/nothings/stb).

## Installation
Clone the repository and install with `chicken-install`.

## API

    [procedure] (stbi-load PATH . REQUESTED-COMPONENTS)

Load image from PATH, optionally requesting an image consisting of
REQUESTED-COMPONENTS number of image components. The result is a list of
the form `(image-data-pointer width height components)`.

    [procedure] (stbi-free IMAGE-DATA)

Free the `image-data-pointer` acquired with `stbi-load`.

## Example
    (require-extension stb-image)

    (let ((img (stbi-load "image.jpg")))
      (print img)
      (stbi-free (car img)))

## Version history
### Version 1.0 Initial release

## Author
Mikko Vanhatalo

## License
Public Domain