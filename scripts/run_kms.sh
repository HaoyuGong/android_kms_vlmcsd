echo "Start the KMS service..."
sleep 1
# Get the proocess architecture
arc0=$(uname -m)
arc1="aarch64"
arc2="x86_64"
# Get the HOST ip
HOST_IP=$(ifconfig | grep 'inet' | grep -v 127 | grep -v inet6| awk '{ print $2}'  | cut -d: -f2 )
# Get the pid if the KMS already on
port=1688
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{ print $1 }');
if [  -n "$pid" ]; then
		echo -e "KMS server has already start at \033[32m $HOST_IP:$port \033[0m"
elif [ "$arc0" = "$arc1" ]; then
		echo -e "Previous arch:\033[32m $arc0 \033[0m"
		sleep 1
		cd ./binaries/Android/arm/static/
		./vlmcsd-android50-arm64v8-static
		sleep 1
		#./vlmcs-android50-arm64v8-static 127.0.0.1:1688
		if [ -n "$(./vlmcs-android50-arm64v8-static 127.0.0.1:1688 | grep "successful")" ]; then
				echo -e "KMS service is ready at\033[32m $HOST_IP:$port \033[0m"
		fi
elif [ "$arc0" = "$arc2" ]; then 
		echo -e "Previous arch:\033[32m $arc0 \033[0m"
		sleep 1
		cd ./binaries/Linux/intel/static/
		./vlmcsd-x64-musl-static
		sleep 1
		#./vlmcs-x64-musl-static 127.0.0.1:1688
		if [ -n "$(./vlmcs-x64-musl-static 127.0.0.1:1688 | grep "successful")" ]; then
				echo -e "KMS service is ready at\033[32m $HOST_IP:$port \033[0m"
		fi
fi
sleep 1
echo -e "\033[32m --------------------- \033[0m"
echo -e "\033[31m Active Windows \033[0m"
echo -e "\033[33m Config the KMS IP \033[0m"
echo -e "\033[32m slmgr -skms $HOST_IP\033[0m"
echo -e "\033[33m Operate active \033[0m"
echo -e "\033[32m slmgr -ato \033[0m"
echo -e "\033[31m Active Office \033[0m"
echo -e "\033[33m Set path of office \033[0m"
echo -e "\033[32m Set-Location 'C:\Program Files\Microsoft Office\Office16' \033[0m"
echo -e "\033[33m Config the KMS IP \033[0m"
echo -e "\033[32m cscript ospp.vbs /sethst:$HOST_IP \033[0m"
echo -e "\033[33m Operate active \033[0m"
echo -e "\033[32m cscript ospp.vbs /act \033[0m"
echo -e "\033[32m --------------------- \033[0m"
