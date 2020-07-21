#!/bin/sh

tools_needed='gawk gcc g++ make patch tar wget bc'
version_gxx=4.8
version_make=3.82

echo "Checking host environment ..."
have_all=true
for cmd in $tools_needed ; do
	command -v "$cmd" > /dev/null ||
		{ echo "    ... '$cmd' command not found."; have_all=false; }
done
$have_all || { echo 'FATAL: Some tools are missing.'; exit 1; }

vc_make=$(echo "$(make --version | head -n1 | sed 's/[^0-9\.]*//' | cut -d. -f-2) >= $version_make" | bc)
[ $vc_make -eq 1 ] || { echo "FATAL: make >= $version_make required."; exit 1; }

vc_gxx=$(echo "$(gcc -dumpversion | cut -d. -f-2) >= $version_gxx" | bc)
[ $vc_gxx -eq 1 ] || { echo "FATAL: gcc / g++ >= $version_gxx required."; exit 1; }

echo 'Ok.'
