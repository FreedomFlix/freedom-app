#!/bin/sh

# Builds FreedomFlix for Linux
# (node-webkit version is for 64 bits linux)

FREEDOMPATH=$(pwd)/../..
NWAPP=$FREEDOMPATH/node-webkit/linux/
BUILDPATH=$(pwd)/FreedomFlix
TMPBUILD=$BUILDPATH/tmp

rm -rf "$BUILDPATH"

# Start by taking the standard node-webkit for linux
mkdir "$BUILDPATH"
cp -a "$NWAPP" "$BUILDPATH/nw"

# Now copy all the necessary files into the tmp build path
mkdir "$TMPBUILD"
cp "$FREEDOMPATH/index.html" "$TMPBUILD"
cp "$FREEDOMPATH/package.json" "$TMPBUILD"
cp -a "$FREEDOMPATH/css" "$TMPBUILD/css"
cp -a "$FREEDOMPATH/js" "$TMPBUILD/js"
cp -a "$FREEDOMPATH/fonts" "$TMPBUILD/fonts"
cp -a "$FREEDOMPATH/images" "$TMPBUILD/images"
cp -a "$FREEDOMPATH/language" "$TMPBUILD/language"
cp -a "$FREEDOMPATH/tmp" "$TMPBUILD/tmp"
cp -a "$FREEDOMPATH/node_modules" "$TMPBUILD/node_modules"

cd $TMPBUILD
zip -r freedom-app.nw *
cat $BUILDPATH/nw/nw freedom-app.nw > $BUILDPATH/freedom-app.run
cd $BUILDPATH
chmod +x $BUILDPATH/freedom-app.run
cp $BUILDPATH/nw/nw.pak $BUILDPATH/nw.pak
cp $BUILDPATH/nw/libffmpegsumo.so $BUILDPATH/libffmpegsumo.so
zip freedom-app_linux64.zip nw.pak libffmpegsumo.so freedom-app.run