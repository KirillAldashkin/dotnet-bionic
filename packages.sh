for pkg in cmake llvm lld clang build-essential python-is-python3 curl git lldb libicu-dev liblttng-ust-dev libssl-dev libkrb5-dev zlib1g-dev qemu qemu-user-static binfmt-support debootstrap
do
    sudo apt install $pkg
    if [[ $? -ne 0 ]]; then
        echo "Could not install $pkg"
        exit -1
    fi
done