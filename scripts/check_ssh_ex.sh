#! /bin/sh

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
STATE_DEPENDENT=4

if test -x /usr/bin/printf; then
	ECHO=/usr/bin/printf
else
	ECHO=echo
fi

print_revision() {
	echo "$1 (nagios-plugins 1.3.0) $2"
	$ECHO "The nagios plugins come with ABSOLUTELY NO WARRANTY. You may redistribute\ncopies of the plugins under the terms of the GNU General Public License.\nFor more information about these matters, see the file named COPYING.\n" | /bin/sed -e 's/\n/ /g'
}

support() {
	$ECHO "Send email to nagios-users@lists.sourceforge.net if you have questions\nregarding use of this software. To submit patches or suggest improvements,\nsend email to nagiosplug-devel@lists.sourceforge.net\n" | /bin/sed -e 's/\n/ /g'
}


if [ su - exuser -c "ssh $1 'id'" 2>&1 ] ; then
    exit $STATE_OK
else
    echo 'fuck!'
    exit $STATE_CRITICAL
fi

