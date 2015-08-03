#!/sbin/busybox sh

# get file descriptor for output
# thanks to Chainfire - http://forum.xda-developers.com/showthread.php?t=1023150
OUTFD=$(ps | grep -v "grep" | grep -o -E "update_binary(.*)" | cut -d " " -f 3)
# TWRP names the extracted update-binary "updater"
[ $OUTFD != "" ] || OUTFD=$(ps | grep -v "grep" | grep -o -E "updater(.*)" | cut -d " " -f 3)

# same as ui_print command in updater_script, for example:
#
# ui_print "hello world!"
#
# will output "hello world!" to recovery, while
#
# ui_print
#
# outputs an empty line

ui_print() {
  if [ $OUTFD != "" ]; then
    echo "ui_print ${1} " >&$OUTFD
    echo "ui_print " >&$OUTFD
  else
    echo "${1}"
  fi;
}


ui_redirect() {
  while read -r line
  do
    echo "ui_print $line" >&$OUTFD
    echo "ui_print " >&$OUTFD
  done
}

# Previous script should determine whether using internal or rom2sd setup

if [ -e /tmp/modules ]; then
# copy modules from /tmp/modules to /system/lib/modules
  ui_print "Replacing system modules"
  cp /tmp/modules/* /system/lib/modules
  rm /tmp/modules
else
# copy modules from internal to /tmp/modules
  ui_print "temporary storing internal modules"
  mkdir /tmp/modules
  cp /system/lib/modules/* /tmp/modules
fi

ui_print "----- done! -----"
