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
