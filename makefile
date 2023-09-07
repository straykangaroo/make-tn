### begin config

# input directory
IMG_DIR		:= images

# thumbnails output directory
TN_DIR		:= thumbs

# thumbnail width and height
TN_W		:= 400
TN_H		:= 400

### end of config


IMG 		:= $(shell find $(IMG_DIR) -type f \( -iname \*.jpg -o -iname \*.png \))
TN			:= $(patsubst $(IMG_DIR)/%,$(TN_DIR)/%,$(IMG))

.PHONY: thumbs
thumbs: $(TN)

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

.PHONY: help
	@echo "Create thumbnails from JPEG and PNG images in a directory tree, recursively recreating it. See README.md"
