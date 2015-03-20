#!/bin/sh
set -e

LRPB_ARGS="--no-chroot"

cd libjpeg-turbo
lirunpkgbuild $LRPB_ARGS
cd ..

cd libpng
lirunpkgbuild $LRPB_ARGS
cd ..

cd physfs
lirunpkgbuild $LRPB_ARGS
cd ..

cd neverball
lirunpkgbuild $LRPB_ARGS
cd ..

echo "____________________"
echo "Creating repository..."
echo ""

rm -rf out_lirepo
mkdir -p out_lirepo
cd out_lirepo
cat > .repo-config <<EOF
GPGKey: 0xBF4DECEB
EOF

#lirepo init .
lirepo add ../libjpeg-turbo/lipkg/*.ipk
lirepo add ../libpng/lipkg/*.ipk
lirepo add ../physfs/lipkg/*.ipk
lirepo add ../neverball/lipkg/*.ipk

cd ..
echo "All done."
