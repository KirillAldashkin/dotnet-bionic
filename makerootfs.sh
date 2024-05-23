cd runtime

sudo ./eng/common/cross/build-android-rootfs.sh arm64 34
if [[ $? -ne 0 ]]; then
    echo "Could not generate the ROOTFS"
    exit -1
fi