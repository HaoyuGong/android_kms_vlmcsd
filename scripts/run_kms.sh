echo "Start the KMS service..."
sleep 1
# Get the proocess architecture
processArch=$(uname -m)
# Get the HOST ip
HOST_IP=$(ifconfig | grep "inet addr" | grep -v 127 | awk '{ print $2}' | awk -F: '{print $2}')
# Get the pid if the KMS already on
port=1688
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{ print $1 }');
if [  -n "$pid" ]; then
		echo "KMS server has already start!!!"
elif [ processArch=="x86_64" ]; then 
		echo "Previous arch: $processArch"
		sleep 1
		cd ./binaries/Linux/intel/static/
		./vlmcsd-x64-musl-static
		sleep 1
		./vlmcs-x64-musl-static 127.0.0.1:1688
elif [ processArch=="aarch64" ]; then
		echo "Previous arch: $processArch"
		sleep 1
		cd ./binaries/Android/arm/static/
		./vlmcsd-android50-arm64v8-static
		sleep 1
		./vlmcs-android50-arm64v8-static 127.0.0.1:1688
fi
sleep 1
echo -e "KMS service is ready at\033[32m $HOST_IP:$port \033[0m"
