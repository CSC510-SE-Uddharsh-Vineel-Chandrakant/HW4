PID=$(ps aux | grep '[i]nfinite.sh' | awk '{print $2}') && [ -n "$PID" ] && kill $PID && echo "infinite.sh process (PID: $PID) has been killed." || echo "No infinite.sh process found."
