CHROOT=frameos-5.5
CHROOT_DIR=/var/lib/mock/$CHROOT/root
MOCK_CMD="/usr/bin/mock --disable-plugin ccache"

source build-srpm.sh

$MOCK_CMD --init -r  $CHROOT
$MOCK_CMD -r $CHROOT --rebuild rpms/SRPMS/anaconda*.rpm


cp $CHROOT_DIR/builddir/build/RPMS/*.rpm rpms
cp $CHROOT_DIR/builddir/build/SRPMS/*.rpm rpms/SRPMS/
