#!/bin/sh

ADPATH="$HOME/Downloads/asciidoc-8.6.9/asciidoc.py"
ADPATH="$HOME/apps/usr/local/bin"
ADPATH="/usr/bin/asciidoc"
ASCIIDOC="$ADPATH --backend=xhtml11 \
	-a linkcss \
	-a stylesdir=style \
	-a stylesheet=style.css \
	-f $PWD/conf/xhtml11.conf \
	-a max-width=1024px"


for INPUT in  *.adoc ; do
	# If a file ending in ".txt" then process with AsciiDoc.
	if [ -f $INPUT ] && [ `echo $INPUT | grep -c ".adoc$"` == 1 ] ; then
		echo "Processing $INPUT"
		OUTPUT=`basename $INPUT .adoc`
		$ASCIIDOC --out-file $OUTPUT.html $INPUT;

		# Else if a directory, process its contents.
	elif [ -d $INPUT ] ; then
		echo "Processing directory $INPUT"
		process_asciidoc `ls $INPUT/*`
	fi
done

