#!/bin/bash

# sudo apt-get install build-essential
# sudo apt install poppler-utils ghostscript  python3-dateutil

#!/bin/bash

galaxy="alpha"
src="/home/mdhender/Far-Horizons"
game="/home/mdhender/${galaxy}"

mkdir -p "${game}" || exit 2

cp "${src}/example.${galaxy}.csv" "${game}/players.csv" || exit 2

sed \
    -e "s;bindir:.*;bindir: ${src}/bin;" \
    -e "s;datadir:.*;datadir: ${game};" \
    "${src}/tools/farhorizons.yml.example" > "${game}/farhorizons.yml" || exit 2

cd "${game}" || exit 2

python3 "${src}/tools/game_setup.py" < "${game}/players.csv"

python3 "${src}/tools/create_map.py"

python3 "${src}/tools/game_packet.py"

rm -f /tmp/alpha.sum /tmp/beta/sum
cd ~/alpha && sha1sum *.dat > /tmp/alpha.sum
cd ~/beta && sha1sum *.dat > /tmp/beta.sum
diff /tmp/alpha.sum /tmp/beta.sum || {
    echo "error: checksums do not match"
    exit 2
}
echo " info: checksums match"
exit 0
