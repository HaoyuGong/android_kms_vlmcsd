echo "Get KMS service..."

if [ -d "binaries" ]; then
	echo "Delete the old version"
	rm -rf binaries
fi

sleep 1
echo "Downloading files…"
# Get the release from the github
wget https://github.com/Wind4/vlmcsd/releases/download/svn1112/binaries.tar.gz

tar -xvzf binaries.tar.gz
sleep 1
rm -f binaries.tar.gz

echo "Successful install KMS services!"
