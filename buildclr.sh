cd runtime
export ROOTFS_DIR=$GITHUB_WORKSPACE/runtime/.tools/android-rootfs/android-ndk-r21/sysroot

./build.sh --cross --arch arm64 --subsetCategory coreclr
if [[ $? -ne 0 ]]; then
    echo "Could not build the CoreCLR"
    exit -1
fi
