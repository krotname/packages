#!/bin/sh

# shellcheck shell=busybox

set -eu

case "$PKG_NAME" in
prplmesh)
	grep -F "prplmesh_version=$PKG_VERSION" /usr/share/prplmesh/config/version
	for config in \
		/usr/share/prplmesh/config/beerocks_agent.conf \
		/usr/share/prplmesh/config/beerocks_controller.conf; do
		grep -Fx 'log_global_levels=error,info,warning,fatal' "$config"
		grep -Fx 'log_global_syslog_levels=error,info,warning,fatal' "$config"
	done
	test -x /usr/libexec/prplmesh/scripts/prplmesh_utils.sh
	/usr/libexec/prplmesh/scripts/prplmesh_utils.sh -h >/dev/null
	grep -F 'register_log_roller || return 1' /etc/init.d/prplmesh
	# shellcheck disable=SC2016
	grep -F '"$helper" roll_logs || logger -t prplmesh "log roll failed"' /etc/init.d/prplmesh
	;;
*)
	echo "Untested package: $PKG_NAME" >&2
	exit 1
	;;
esac
