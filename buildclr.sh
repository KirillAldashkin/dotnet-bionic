cd runtime
export ROOTFS_DIR=$GITHUB_WORKSPACE/runtime/.tools/android-rootfs/android-ndk-r21/sysroot
tree $ROOTFS_DIR
./build.sh --cross --arch arm64 --subset clr
if [[ $? -ne 0 ]]; then
    echo "Could not build the CoreCLR"
    exit -1
fi
