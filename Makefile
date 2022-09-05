########################################################################

# This file is part of the UNAM RATIR/RATTEL software.

# $Id: Makefile.in 3016 2017-12-07 05:25:27Z alan $

########################################################################

# Copyright © 2011 Alan M. Watson <alan@astroscu.unam.mx>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

########################################################################

HTMLS =	                  \
  index.html              \
  telescope.html          \
  instrument.html         \
  acknowledgements.html   \
  data-archive.html       \
  calibration-data.html   \
  grb-program.html        \
  gallery.html            \
  participants.html       \
  publications.html       \
  contact.html            \
  search.html             \

EXTRA_HTML_DEPENDENCIES = HEADER.md FOOTER.md *.meta

all: $(HTMLS)

install-remote: all
	rsync -v --chmod=u=rwX,go=rX \
	  ratir.conf transientscu-services:/etc/apache2/sites-enabled/
	rsync -ahv --chmod=u=rwX,go=rX --delete \
	  --exclude=.git/ \
	  --include=./ \
	  --include=*/ \
	  --include=*.html \
	  --include=*.pdf \
	  --include=*.jpg \
	  --include=*.png \
	  --include=*.css \
	  --include=*.mp4 \
	  --exclude=* \
	  . transientscu-services:/usr/local/var/www/ratir/html

install-local: all
	rsync -v --chmod=u=rwX,go=rX \
	  ratir.conf /etc/apache2/sites-enabled/
	rsync -ahv --chmod=u=rwX,go=rX --delete \
	  --exclude=.git/ \
	  --include=./ \
	  --include=*/ \
	  --include=*.html \
	  --include=*.pdf \
	  --include=*.jpg \
	  --include=*.png \
	  --include=*.css \
	  --include=*.mp4 \
	  --exclude=* \
	  . /usr/local/var/www/ratir/html

########################################################################

TOOLSDIR = ./tools
include $(TOOLSDIR)/Makefile.tools
include ./Makefile.dependencies
