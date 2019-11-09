echo" Get KMS service"
if [ -d "binaries" ]; then
	echo "Delete the old version"
	rm -r binaries
fi
sleep 2
echo "Downloading files…"
wget https://github.com/Wind4/vlmcsd/releases/download/svn1112/binaries.tar.gz

tar -xvzf binaries.tar.gz
sleep 1
rm binaries.tar.gz

echo "Successful install KMS services!"
