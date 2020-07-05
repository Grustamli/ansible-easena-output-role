BEGIN { FS = "|"; ORS = " " }
FNR > 1 { gsub(/ /, "", $2); print $2 }