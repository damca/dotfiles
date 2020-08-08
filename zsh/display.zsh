export DISPLAY=$(getent hosts damcaG5.local | awk '/damca/ {print $1; exit}'):0
