cd $GITHUB_WORKSPACE/runtime
export ROOTFS_DIR=$GITHUB_WORKSPACE/runtime/.tools/android-rootfs/android-ndk-r21/sysroot
mkdir $ROOTFS_DIR/etc
cp $ROOTFS_DIR/android_platform $ROOTFS_DIR/etc/os_release

./build.sh --cross --arch arm64 --subset clr
if [[ $? -ne 0 ]]; then
    echo "Could not build the CoreCLR"
    exit -1
fi
