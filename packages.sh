sudo dpkg --add-architecture arm64
sudo bash -c 'cat > /etc/apt/sources.list.d/arm64.list <<EOF
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ jammy main restricted
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ jammy-updates main restricted
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ jammy-backports main restricted universe multiverse
EOF'
sudo sed -i -e 's/deb http/deb [arch=amd64] http/g' /etc/apt/sources.list
sudo sed -i -e 's/deb mirror/deb [arch=amd64] mirror/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y clang llvm binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu zlib1g-dev:arm64

sudo apt install -y \
	cmake llvm lld clang build-essential python-is-python3 curl git lldb \
	libicu-dev liblttng-ust-dev libssl-dev libkrb5-dev zlib1g-dev qemu \
	qemu-user-static binfmt-support debootstrap
