echo "Stop KMS service..."

port=1688
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/"'{print $1}');

if [ -n "$pid" ]; then
      kill -9 $pid
      echo "Stop KMS service successful!!!"
fi
