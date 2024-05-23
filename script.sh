echo "Path: $GITHUB_WORKSPACE"

for pkg in cmake llvm lld clang build-essential python-is-python3 curl git lldb libicu-dev liblttng-ust-dev libssl-dev libkrb5-dev zlib1g-dev qemu qemu-user-static binfmt-support debootstrap
do
    sudo apt install $pkg
    if [[ $? -ne 0 ]]; then
        echo "Could not install $pkg"
        exit -1
    fi
done

git clone https://github.com/dotnet/runtime.git
    if [[ $? -ne 0 ]]; then
        echo "Could not clone repository"
    exit -1
fi
cd runtime

sudo ./eng/common/cross/build-android-rootfs.sh arm64 34
if [[ $? -ne 0 ]]; then
    echo "Could not generate the ROOTFS"
exit -1