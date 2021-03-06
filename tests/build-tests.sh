#!/bin/sh

PREFIX={1:=toolchains}

total_failed=0
total_skipped=0
total_ok=0

T_OK=0
T_FAIL=1
T_SKIP=2

RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
NORMAL="\033[m"
LEFTALIGN="\033[0G"

test_start()
{
	printf "[....] %s " "$*"
}

test_end()
{
	if [ "x$1" = "x$T_OK" ]; then
		printf "%b[%b OK %b]\n" $LEFTALIGN $GREEN $NORMAL
		total_ok=$(($total_ok + 1))
	elif [ "x$1" = "x$T_SKIP" ]; then
		printf "%b[%bSKIP%b]\n" $LEFTALIGN $CYAN $NORMAL
		total_skipped=$(($total_skipped + 1))
	elif [ "x$1" = "x$T_FAIL" ]; then
		printf "%b[%bFAIL%b]\n" $LEFTALIGN $RED $NORMAL
		total_failed=$(($total_failed + 1))
	else
		printf "%b[ %d ]\n" $LEFTALIGN $1
	fi
}

if ! test -z "$1"; then
	PREFIX=$(readlink -f "$1") || exit 1
fi

echo "Using toolchains in '$PREFIX'..."

BINDIR="$PREFIX/bin"
PATH="$BINDIR:$PATH"

SRCDIR=$(dirname "$(readlink -f "$0")")
INDIR="$SRCDIR"/../targets
OUTDIR="$SRCDIR"/build

rm -rf "$OUTDIR"
mkdir -p "$OUTDIR"

for mktarget in "$INDIR"/* ; do
	target="$(basename $mktarget)";
	target="${target%???}"
	test_start "$target, dynamically linked executable"
	R=$T_FAIL
	if [ -x "$BINDIR/$target-gcc" ]; then
		"$target-gcc" -o "$OUTDIR/test-$target" "$SRCDIR/test.c"
		[ $? -eq 0 ] && R=$T_OK
	else
		R=$T_SKIP
	fi
	test_end $R

	test_start "$target, statically linked executable"
	R=$T_FAIL
	if [ -x "$BINDIR/$target-gcc" ]; then
		"$target-gcc" -static -o "$OUTDIR/test-$target-static" "$SRCDIR/test.c"
		[ $? -eq 0 ] && R=$T_OK
	else
		R=$T_SKIP
	fi
	test_end $R
done

echo 'Summary:'
printf "%b%d successful%b, " $GREEN $total_ok $NORMAL
printf "%b%d failed%b, " $RED $total_failed $NORMAL
printf "%b%d skipped%b.\n" $CYAN $total_skipped $NORMAL
echo 'Test builds completed.'
