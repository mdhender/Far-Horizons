#!/bin/bash

for file in *.h *.c; do
	uncrustify -c .uncrustify.cfg "${file}" || exit 2
	mv "${file}.uncrustify" "${file}" || exit 2
done
