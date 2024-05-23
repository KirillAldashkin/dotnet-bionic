cd runtime
export ROOTFS_DIR=$GITHUB_WORKSPACE/runtime/.tools/android-rootfs/android-ndk-r21/sysroot

./build.sh --cross --arch arm64 --subset libs
if [[ $? -ne 0 ]]; then
    echo "Could not build the libraries"
    exit -1
fi
