cd $GITHUB_WORKSPACE

apt install -y tree \
	cmake llvm lld clang build-essential python-is-python3 curl git lldb \
	libicu-dev liblttng-ust-dev libssl-dev libkrb5-dev zlib1g-dev qemu \
	qemu-user-static binfmt-support debootstrap
