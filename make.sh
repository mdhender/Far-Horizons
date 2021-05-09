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

exit 2


exit 2

galaxy=alpha

while [ -n "${1}" ]; do
	if [ -n "${galaxy}" ]; then
		echo "error: unknown option '${1}'"
		exit 2
	fi
	shift
done

home="${HOME}/${galaxy}"
mkdir -p "${home}"

cd "${home}" || exit 2

sed "s;DATADIR;${home};" ~/farhorizons.yml > farhorizons.yml || exit 2
cp ~/players.csv .

python3 ${HOME}/Far-Horizons/tools/game_setup.py < players.csv

#	mdhender@far-horizons:~/Far-Horizons$ ls -ltr game/
#	total 324
#	-rw-rw-r-- 1 mdhender mdhender   529 May  5 05:07 noorders.txt
#	-rw-rw-r-- 1 mdhender mdhender   509 May  5 05:07 deadline.msg
#	-rw-rw-r-- 1 mdhender mdhender   721 May  5 05:37 farhorizons.yml
#	-rw------- 1 mdhender mdhender   504 May  5 05:37 HS9
#	-rw------- 1 mdhender mdhender   448 May  5 05:37 HS8
#	-rw------- 1 mdhender mdhender   392 May  5 05:37 HS7
#	-rw------- 1 mdhender mdhender   336 May  5 05:37 HS6
#	-rw------- 1 mdhender mdhender   280 May  5 05:37 HS5
#	-rw------- 1 mdhender mdhender   224 May  5 05:37 HS4
#	-rw------- 1 mdhender mdhender   168 May  5 05:37 HS3
#	-rw-rw-r-- 1 mdhender mdhender   773 May  5 05:37 sp01.log
#	-rw-rw-r-- 1 mdhender mdhender   722 May  5 05:37 sp02.log
#	-rw-rw-r-- 1 mdhender mdhender   558 May  5 05:37 sp03.log
#	-rw-rw-r-- 1 mdhender mdhender   498 May  5 05:37 sp04.log
#	-rw-rw-r-- 1 mdhender mdhender   571 May  5 05:37 sp05.log
#	-rw-rw-r-- 1 mdhender mdhender   570 May  5 05:37 sp06.log
#	-rw-rw-r-- 1 mdhender mdhender   722 May  5 05:37 sp07.log
#	-rw-rw-r-- 1 mdhender mdhender   571 May  5 05:37 sp08.log
#	-rw-rw-r-- 1 mdhender mdhender   571 May  5 05:37 sp09.log
#	-rw-rw-r-- 1 mdhender mdhender   772 May  5 05:37 sp10.log
#	-rw-rw-r-- 1 mdhender mdhender   498 May  5 05:37 sp11.log
#	-rw-rw-r-- 1 mdhender mdhender   571 May  5 05:37 sp12.log
#	-rw-rw-r-- 1 mdhender mdhender   440 May  5 05:37 sp13.log
#	-rw-rw-r-- 1 mdhender mdhender   722 May  5 05:37 sp14.log
#	-rw-rw-r-- 1 mdhender mdhender   773 May  5 05:37 sp15.log
#	-rw-rw-r-- 1 mdhender mdhender   663 May  5 05:37 sp16.log
#	-rw-rw-r-- 1 mdhender mdhender   557 May  5 05:37 sp17.log
#	-rw------- 1 mdhender mdhender 14260 May  5 05:37 stars.dat
#	-rw-rw-r-- 1 mdhender mdhender   773 May  5 05:37 sp18.log
#	-rw------- 1 mdhender mdhender 37580 May  5 05:37 planets.dat
#	-rw------- 1 mdhender mdhender    16 May  5 05:37 galaxy.dat
#	-rw-rw-r-- 1 mdhender mdhender   486 May  5 05:37 fh_names
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp18.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp17.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp16.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp15.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp14.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp13.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp12.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp11.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp10.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp09.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp08.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp07.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp06.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp05.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp04.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp03.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp02.dat
#	-rw------- 1 mdhender mdhender   832 May  5 05:37 sp01.dat
#	-rw------- 1 mdhender mdhender    72 May  5 05:37 locations.dat
#	-rw-rw-r-- 1 mdhender mdhender  2419 May  5 05:37 sp18.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2200 May  5 05:37 sp17.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2309 May  5 05:37 sp16.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2419 May  5 05:37 sp15.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2367 May  5 05:37 sp14.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2083 May  5 05:37 sp13.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2217 May  5 05:37 sp12.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2144 May  5 05:37 sp11.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2416 May  5 05:37 sp10.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2217 May  5 05:37 sp09.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2217 May  5 05:37 sp08.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2367 May  5 05:37 sp07.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2214 May  5 05:37 sp06.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2217 May  5 05:37 sp05.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2144 May  5 05:37 sp04.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2204 May  5 05:37 sp03.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2367 May  5 05:37 sp02.rpt.t1
#	-rw-rw-r-- 1 mdhender mdhender  2420 May  5 05:37 sp01.rpt.t1

python3 ${HOME}/Far-Horizons/tools/create_map.py

#	mdhender@far-horizons:~/Far-Horizons$ ls -ltr game/
#	-rw-rw-r-- 1 mdhender mdhender   721 May  5 05:43 farhorizons.yml
#	-rw-rw-r-- 1 mdhender mdhender 14796 May  5 05:43 galaxy_map_3d.pdf
#	-rw-rw-r-- 1 mdhender mdhender 10469 May  5 05:43 galaxy_map.pdf
#	-rw-rw-r-- 1 mdhender mdhender 21724 May  5 05:43 galaxy.map.pdf


python3 ${HOME}/Far-Horizons/tools/game_packet.py

#	-rw-rw-r-- 1 mdhender mdhender   721 May  5 05:46 farhorizons.yml
#	-rw-rw-r-- 1 mdhender mdhender  6601 May  5 05:46 galaxy.list.txt
#	-rw-rw-r-- 1 mdhender mdhender 22453 May  5 05:46 sp01.zip
#	-rw-rw-r-- 1 mdhender mdhender 22364 May  5 05:46 sp03.zip
#	-rw-rw-r-- 1 mdhender mdhender 22451 May  5 05:46 sp02.zip
#	-rw-rw-r-- 1 mdhender mdhender 22338 May  5 05:46 sp04.zip
#	-rw-rw-r-- 1 mdhender mdhender 22363 May  5 05:46 sp06.zip
#	-rw-rw-r-- 1 mdhender mdhender 22362 May  5 05:46 sp05.zip
#	-rw-rw-r-- 1 mdhender mdhender 22447 May  5 05:46 sp07.zip
#	-rw-rw-r-- 1 mdhender mdhender 22363 May  5 05:46 sp08.zip
#	-rw-rw-r-- 1 mdhender mdhender 22361 May  5 05:46 sp09.zip
#	-rw-rw-r-- 1 mdhender mdhender 22455 May  5 05:46 sp10.zip
#	-rw-rw-r-- 1 mdhender mdhender 22336 May  5 05:46 sp11.zip
#	-rw-rw-r-- 1 mdhender mdhender 22363 May  5 05:46 sp12.zip
#	-rw-rw-r-- 1 mdhender mdhender 22306 May  5 05:46 sp13.zip
#	-rw-rw-r-- 1 mdhender mdhender 22442 May  5 05:46 sp14.zip
#	-rw-rw-r-- 1 mdhender mdhender 22455 May  5 05:46 sp15.zip
#	-rw-rw-r-- 1 mdhender mdhender 22417 May  5 05:46 sp16.zip
#	-rw-rw-r-- 1 mdhender mdhender 22365 May  5 05:46 sp17.zip
#	-rw-rw-r-- 1 mdhender mdhender 22455 May  5 05:46 sp18.zip

