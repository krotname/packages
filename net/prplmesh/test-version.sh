#!/bin/sh

# shellcheck shell=busybox

set -eu

case "$PKG_NAME" in
prplmesh) ;;
*)
	echo "Unexpected package: $PKG_NAME" >&2
	exit 1
	;;
esac

[ -n "$PKG_VERSION" ]

# These entry points handle --version before configuration or daemon startup.
# In particular, ieee1905_transport ignores version flags and starts its broker;
# do not let the generic flag sweep start it repeatedly in the test container.
for binary in beerocks_agent beerocks_controller; do
	output="$(timeout --kill-after=5s 10s "/usr/libexec/prplmesh/bin/$binary" --version 2>&1)"
	printf '%s\n' "$output" | grep -F "$binary $PKG_VERSION ("
done
