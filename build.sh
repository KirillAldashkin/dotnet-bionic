cd $GITHUB_WORKSPACE
# Install packages
apt install -y \
	cmake llvm lld clang build-essential python-is-python3 curl git lldb \
	libicu-dev liblttng-ust-dev libssl-dev libkrb5-dev zlib1g-dev qemu \
	qemu-user-static binfmt-support debootstrap
if [[ $? -ne 0 ]]; then
    echo "Could not install dependencies"
    exit -1
fi
# Clone the 'dotnet/runtime' repository
git clone https://github.com/dotnet/runtime.git
if [[ $? -ne 0 ]]; then
    echo "Could not clone repository"
    exit -1
fi
cd runtime
# Generate the ROOTFS
./eng/common/cross/build-android-rootfs.sh
if [[ $? -ne 0 ]]; then
    echo "Could not generate the ROOTFS"
    exit -1
fi
export ROOTFS_DIR=$GITHUB_WORKSPACE/runtime/.tools/android-rootfs/android-ndk-r21/sysroot
# Build CoreCLR + BCL
./build.sh --cross --arch arm64 --subset clr+libs
if [[ $? -ne 0 ]]; then
    echo "Could not build .NET"
    exit -1
fi
