#!/bin/bash - 
#===============================================================================
#
#          FILE:  checkpasswd.sh
# 
#         USAGE:  ./checkpasswd.sh 
# 
#   DESCRIPTION:  vérifie que tous les chemins vers les shells de /etc/passwd sont valables
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Dr. Fritz Mehner (fgm), mehner@fh-swf.de
#       COMPANY: FH Südwestfalen, Iserlohn
#       CREATED: 01/01/2002 12:14:39 CET
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SHELLS=`gawk -F: '{print $7}' /etc/passwd |sort |uniq |tr  '\n' ' '`
#echo "SHELLS vaut $SHELLS"
function F_map_msg_err_si_existe_pas(){
for shell in $@;
do
	if [ !  -f "$shell" ]; then echo "le chemin $shell existe pas dans /etc/passwd"; fi
done
}

F_map_msg_err_si_existe_pas "$SHELLS"
# test à claquer en tdd
F_map_msg_err_si_existe_pas "bash"
