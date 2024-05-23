git clone https://github.com/dotnet/runtime.git
    if [[ $? -ne 0 ]]; then
        echo "Could not clone repository"
    exit -1
fi
