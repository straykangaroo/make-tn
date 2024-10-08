# make-tn

A makefile for creating thumbnails of JPEG and PNG images in a directory tree, recursively recreating it.
Being a makefile, it only (re)creates the thumbnails if the original file has not been existing before or it has been modified.

**Warning** Being a makefile, it does not detect file deletion in the original directory tree. **This might lead to leftover thumbnails**.


## Details

-   The size of the thumbnails, as well as the source directory and the thumbnails directory may be configured (see [configuration](#configuration) below).
-   Thumbnails are created resizing the image and centering it in both dimensions. If the source image is smaller (in both dimensions) than the requested thumbnail size, the thumbnail will be the same as the source image
-   Profile and EXIF data are stripped


## Example

```sh
make            # in the directory where you put make-tn's makefile
```

from the following directory structure
-   images/01.jpg
-   images/02.jpg
-   images/sub/03.jpg
-   images/sub/sub/04.png

```make-tn``` creates the thumbnails
-   thumbs/01.jpg
-   thumbs/02.jpg
-   thumbs/sub/03.jpg
-   thumbs/sub/sub/04.png

as well as, if not already existing, the following directories
-   thumbs
-   thumbs/sub
-   thumbs/sub/sub


## Configuration

Several variables may be set on the command line

```sh
make TN_DIR=my_thumbs
```

-   **IMG_DIR** images input directory (default is "images")
-   **TN_DIR**  thumbnails output directory (default is "thumbs")
-   **TN_W**    thumbnail width (in pixels, default is 400)
-   **TN_H**    thumbnail height (in pixels, default is 400)


## Requirements

```make-tn``` requires ```make``` and ```convert``` (part of ```ImageMagick```)


## License

Distributed under the MIT License. See LICENSE.txt for more information.


## Contact

[https://github.com/straykangaroo/make-tn](https://github.com/straykangaroo/make-tn)
