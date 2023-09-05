# TODO:
# - make help

# - Crea thumbnail a partire dalle immagini .jpg e .png  (estensione case insensitive) in una directory e sue sottodirectory (ricorsivamente),
#	posiziona i thumbnail in un'altra directory ricreando l'albero di sottodirectory.
#
#	es, da:
#	/images/01.jpg /images/02.jpg /images/sub/03.jpg /images/sub/sub/04.png
#	crea i thumbnail:
#	/thumb/01.jpg /thumb/02.jpg /thumb/sub/03.jpg /thumb/sub/sub/04.png
#	creando implicitamente, se non esistenti, le directory: /thumb /thumb/sub /thumb/sub/sub
#
# - Se almeno una delle dimensioni dell'immagine originale diversa da quella desiderata per il thumbnail, effettua un taglio centrato instagram-style
# - Se nessuna delle due dimensioni dell'immagine originale maggiore da quella desiderata per il thumbnail, non ingrandisce immagine
# - Profile and EXIF data are stripped

### config

# input directory
IMG_DIR		:= img

# thumbnails output directory
TN_DIR		:= tn

# thumbnail width and height
TN_W		:= 400
TN_H		:= 400

### end of config


IMG 		:= $(shell find $(IMG_DIR) -type f \( -iname \*.jpg -o -iname \*.png \))
TN			:= $(patsubst $(IMG_DIR)/%,$(TN_DIR)/%,$(IMG))

all: $(TN)

# convert: -auto-orient must go first
$(TN_DIR)/%: $(IMG_DIR)/%
	mkdir -p $(@D)
	convert $< \
	-auto-orient \
	-resize "$(TN_W)x$(TN_H)^>" \
	-gravity center \
	-crop $(TN_W)x$(TN_H)+0+0 \
	-strip \
	+profile "*" \
	$@
	
.PHONY: clean
clean:
	rm -rf $(TN_DIR)

	
	
	
