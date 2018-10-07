#!/bin/bash

EDITOR=vim

while :
do
	clear
	echo "Выберите действие:"
	echo
	echo "a) start app"
	echo "b) edit .bashrc"
	echo "c) edit .conkyrc"
	echo "f) fluxbox menu"
	echo "g) script conky_group"
	echo "i) idesk"
	echo "m) mc menu"
	echo "n) edit .nanorc"
	echo "o) openvpn"
	echo "p) edit passwords"
	echo "r) edit this script"
	echo "u) reconfigure fluxbox"
	echo "y) edit mime-types"
	echo "x) edit .xinitrc"
	echo "*) close"
	echo; read -s -n1 vybor

	case $vybor in
#		"d|") $EDITOR ~/.config/dunst/dunstrc;;
		"a"|"ф")
			clear 
			echo "y) play from youtube"

			read -s -n1 apps_v
			case $apps_v in
				"y"|"н")
					bash ~/distrib/Linux/scripts/mpv_youtube_play.sh
					exit 0
				;;
			esac
		;;
		"b"|"и") $EDITOR ~/.bashrc;;
		"c"|"с") mc ~/.conkyrc.d ~/.conkyrc.d;;
#		"c"|"с") $EDITOR ~/.conkyrc;;
		#"d"|"в") $EDITOR ~/temp/share_dropbox/temp/doit;;
		"f"|"а")
			clear 
			echo "a) apps (fluxbox)"
			echo "k) keys (fluxbox)"
			echo "m) menu (fluxbox)"
			echo "s) style (fluxbox) new"
			echo "t) style (fluxbox) edit"

			read -s -n1 fluxbox_v
			case $fluxbox_v in
				"a"|"ф") $EDITOR ~/.fluxbox/apps;;
				"k"|"л") $EDITOR ~/.fluxbox/keys;;
				"m"|"ь") $EDITOR ~/.fluxbox/menu;;
				"s"|"ы")
					echo "Скопируй нужную тему в /usr/share/fluxbox/styles/, назвав её default"
					sudo mc /home/ditsi/OS\'s_and_progs/debian/PKGS/themes/fluxbox /usr/share/fluxbox/styles/
				;;
				"t"|"е") mc ~/.fluxbox/styles/ ~/.fluxbox/styles/;;
			esac
		;;
		"g"|"п") xterm -e /usr/scripts/conky_group;;
		"h"|"р") 
			bash /usr/scripts/bluetooth_headsets
			exit 0
		;;
		"i"|"ш") /usr/scripts/mk_icon;;
		"l"|"д") $EDITOR ~/.translate_dict/my_dict.txt;;
		"m"|"ь")
			clear
			echo "e) edit .config/mc/mc.ext"
			echo "h) edit ~/.config/mc/hotlist"
			read -s -n1 mc_v
			case $mc_v in
				"e"|"у") $EDITOR ~/.config/mc/mc.ext;;
				"h"|"р") $EDITOR ~/.config/mc/hotlist;;
			esac
		;;
		"n"|"т") $EDITOR ~/.nanorc;;
		"o"|"щ")
			clear
			echo -e "1) start openvpn"
			echo -e "0) stop openvpn"
			read -s -n1 openvpn_v
			case $openvpn_v in
				1)
					sudo systemctl start openvpn-client@ditsi_ultrabook.service
					exit 0
				;;
				0)
					sudo systemctl stop openvpn-client@ditsi_ultrabook.service
					exit 0
				;;
				*)
					break
				;;
			esac
		;;
		"p"|"з") $EDITOR ~/life/passws.txt;;
		"r"|"к") sudo $EDITOR /usr/scripts/interface;;
		"u"|"г") fluxbox-update_configs;;
		"y"|"н")
			xterm -hold -e "ls /usr/share/applications/*.desktop" &
			$EDITOR ~/.local/share/applications/defaults.list
		;;
		"x"|"ч") $EDITOR ~/.xinitrc;;
		*) exit 0;;
	esac
done
