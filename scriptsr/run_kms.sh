echo "Start the KMS service..."

cd ./binaries/Android/arm/static/
./vlmcsd-android50-arm64v8-static
./vlmcs-android50-arm64v8-static 127.0.0.1:1688
