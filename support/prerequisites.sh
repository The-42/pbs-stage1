#!/bin/sh

tools_needed='gawk gcc g++ help2man make patch tar wget'
version_gxx=4.8
version_make=3.82

echo "Checking host environment ..."
have_all=true
for cmd in $tools_needed ; do
	command -v "$cmd" > /dev/null ||
		{ echo "    ... '$cmd' command not found."; have_all=false; }
done
$have_all || { echo 'FATAL: Some tools are missing.'; exit 1; }

vc_make=$(expr $(make --version | head -n1 | sed 's/[^0-9\.]*//') \>= "$version_make")
[ $vc_make -eq 1 ] || { echo "FATAL: make >= $version_make required."; exit 1; }

vc_gxx=$(expr $(gcc -dumpversion) \>= "$version_gxx")
[ $vc_gxx -eq 1 ] || { echo "FATAL: gcc / g++ >= $version_gxx required."; exit 1; }

echo 'Ok.'
