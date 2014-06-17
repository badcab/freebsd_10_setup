#! /bin/sh
 
# fetch --no-verify-peer https://gist.github.com/badcab/7964370/download
# tar -zxvf download
# rm download
# mv gist*/freeBSD10_setup.sh .
# chmod +x freeBSD10_setup.sh
# rm -r gist*
 
#install TrueOS from PC-BSD rather than regular FreeBSD, not nessisary but this is what I am testing on
 
 
#look into uncomenting BATCH in make.conf
#add some things to make.conf for kern building to
#add some stuff to the make.conf  WITHOUT_MODULES = linux acpi sound to black list modules to not rebuild
#use the su -c to run the update cmd
 
for D in `ls /usr/home`
do
	(su $D -c 'ssh-keygen -t rsa')
done
 
SVN_URL=svn://svn.freebsd.org/base/releng/$(freebsd-version | cut -d - -f 1)
 
freebsd-update fetch install
 
pkg install -y zsh sudo screen git ccrypt xorg leafpad x11/slim x11/mate portupgrade
pkg install -y php55 php55-curl php55-hash php55-json devel/subversion emulators/linux_base-f10
pkg install -y chromium firefox
 
echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /usr/local/etc/sudoers.d/no-pass
 
if [ ! -d /usr/local/etc/X11/xinit/xinitrc.d ] ;then
	mkdir /usr/local/etc/X11/xinit/xinitrc.d
	touch /usr/local/etc/X11/xinit/xinitrc.d/mate.sh
	chmod +x /usr/local/etc/X11/xinit/xinitrc.d/mate.sh
	echo "exec mate-session" >> /usr/local/etc/X11/xinit/xinitrc.d/mate.sh
fi
#still broken
 
#loader
if ! grep 'linux_load' /boot/loader.conf ;then
	echo 'linux_load="YES"' >> /boot/loader.conf
fi
 
if ! grep 'loader_logo' /boot/loader.conf ;then
	echo 'loader_logo="beastie"' >> /boot/loader.conf
fi
 
if ! grep 'sem_load' /boot/loader.conf ;then
	echo 'sem_load="YES"' >> /boot/loader.conf
fi
 
#fstab
if ! grep 'proc' /etc/fstab ;then
	echo 'proc		/proc	procfs	rw,noauto	0	0' >> /etc/fstab
fi
 
if ! grep 'fdesc' /etc/fstab ;then
	echo 'fdesc		/dev/fd	fdescfs	rw,noauto	0	0' >> /etc/fstab
fi
 
#periodic
if ! grep 'daily_clean_preserve_enable' /etc/periodic.conf ;then
	echo 'daily_clean_preserve_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_backup_pkgdb_enable' /etc/periodic.conf ;then
	echo 'daily_backup_pkgdb_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_backup_aliases_enable' /etc/periodic.conf ;then
	echo 'daily_backup_aliases_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_ipfwdenied_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_ipfwdenied_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_ipfdenied_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_ipfdenied_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_chkmounts_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_chkmounts_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_pfdenied_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_pfdenied_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'weekly_status_pkg_enable' /etc/periodic.conf ;then
	echo 'weekly_status_pkg_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'monthly_accounting_enable' /etc/periodic.conf ;then
	echo 'monthly_accounting_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'weekly_noid_enable' /etc/periodic.conf ;then
	echo 'weekly_noid_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_chksetuid_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_chksetuid_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_clean_rwho_enable' /etc/periodic.conf ;then
	echo 'daily_clean_rwho_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_chkportsum_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_chkportsum_enable="NO"' >> /etc/periodic.conf
fi
 
if ! grep 'daily_status_security_neggrpperm_enable' /etc/periodic.conf ;then
	echo 'daily_status_security_neggrpperm_enable="NO"' >> /etc/periodic.conf
fi
 
#make
if ! grep 'WITH_X11' /etc/make.conf ;then
	echo 'WITH_X11=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_NEW_X11' /etc/make.conf ;then
	echo 'WITH_NEW_X11=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_EXAMPLES' /etc/make.conf ;then
	echo 'WITH_EXAMPLES=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_CRYPTO' /etc/make.conf ;then
	echo 'WITH_CRYPTO=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_INFO' /etc/make.conf ;then
	echo 'WITH_INFO=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_MAN' /etc/make.conf ;then
	echo 'WITH_MAN=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_XTERM_256' /etc/make.conf ;then
	echo 'WITH_XTERM_256=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_CA_BUNDLE' /etc/make.conf ;then
	echo 'WITH_CA_BUNDLE=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_MANPAGES' /etc/make.conf ;then
	echo 'WITH_MANPAGES=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_ZSH' /etc/make.conf ;then
	echo 'WITH_ZSH=YES' >> /etc/make.conf
fi
 
if ! grep 'WITH_PKGNG' /etc/make.conf ;then
	echo 'WITH_PKGNG=YES' >> /etc/make.conf
fi
 
if ! grep 'OPTIONS_SET' /etc/make.conf ;then
	echo 'OPTIONS_SET=DOCS HELP NLS' >> /etc/make.conf
fi
 
if ! grep 'WITH_CUPS' /etc/make.conf ;then
	echo 'WITH_CUPS=0' >> /etc/make.conf
fi
 
if ! grep 'WITH_DEBUG' /etc/make.conf ;then
	echo 'WITH_DEBUG=0' >> /etc/make.conf
fi
 
if ! grep 'RANDOMIZE_MASTER_SITES' /etc/make.conf ;then
	echo 'RANDOMIZE_MASTER_SITES=YES' >> /etc/make.conf
fi
 
#rc
if ! grep 'sshd_enable' /etc/rc.conf ;then
	echo 'sshd_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'moused_enable' /etc/rc.conf ;then
	echo 'moused_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'ntpd_enable' /etc/rc.conf ;then
	echo 'ntpd_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'dbus_enable' /etc/rc.conf ;then
	echo 'dbus_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'hald_enable' /etc/rc.conf ;then
	echo 'hald_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'avahi_daemon_enable' /etc/rc.conf ;then
	echo 'avahi_daemon_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'avahi_dnsconfd_enable' /etc/rc.conf ;then
	echo 'avahi_dnsconfd_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'slim_enable' /etc/rc.conf ;then
	echo 'slim_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'ntpd_sync_on_start' /etc/rc.conf ;then
	echo 'ntpd_sync_on_start="YES"' >> /etc/rc.conf
fi
 
if ! grep 'sendmail_enable' /etc/rc.conf ;then
	echo 'sendmail_enable="NONE"' >> /etc/rc.conf
fi
 
if ! grep 'usbd_enable' /etc/rc.conf ;then
	echo 'usbd_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'clear_tmp_enable' /etc/rc.conf ;then
	echo 'clear_tmp_enable="YES"' >> /etc/rc.conf
fi
 
if ! grep 'linux_enable' /etc/rc.conf ;then
	echo 'linux_enable="YES"' >> /etc/rc.conf
fi
 
echo '#!' '/bin/sh' > /usr/local/bin/update
chmod a+x /usr/local/bin/update
echo 'case "$*" in' >> /usr/local/bin/update
echo '*-p*)' >> /usr/local/bin/update
echo 'portsnap fetch update' >> /usr/local/bin/update
echo '/usr/local/sbin/portupgrade -a' >> /usr/local/bin/update
echo ';;' >> /usr/local/bin/update
echo '*-b*)' >> /usr/local/bin/update
echo '/usr/sbin/freebsd-update fetch install' >> /usr/local/bin/update
echo ';;' >> /usr/local/bin/update
echo '*-s*)' >> /usr/local/bin/update
echo 'if [ ! -d /usr/src/.svn ] ; then' >> /usr/local/bin/update
echo 'svn co' $SVN_URL '/usr/src' >> /usr/local/bin/update
echo 'fi' >> /usr/local/bin/update
echo 'svn update /usr/src' >> /usr/local/bin/update
echo ';;' >> /usr/local/bin/update
echo '*)' >> /usr/local/bin/update
echo '/usr/sbin/pkg upgrade' >> /usr/local/bin/update
echo ';;' >> /usr/local/bin/update
echo 'esac' >> /usr/local/bin/update
 
for D in `ls /usr/home`
do
	(chsh -s $(which zsh) $D)
	(su $D -c 'touch ~/.ssh/authorized_keys')
	(su $D -c "sed -i.bak 's/EDITOR=vi/EDITOR=ee/g' ~/.profile")
	(su $D -c 'touch ~/.zshrc')
	(echo 'zmodload zsh/complist' > /usr/home/$D/.zshrc)
	(echo 'autoload -U compinit && compinit' >> /usr/home/$D/.zshrc)
	(echo 'setopt autocd' >> /usr/home/$D/.zshrc)
	(echo 'autoload -U colors && colors' >> /usr/home/$D/.zshrc)
	(echo "zstyle 'completion:::::' completer _complete _approximate" >> /usr/home/$D/.zshrc)
	(echo "zstyle ':completion:*' menu select" >> /usr/home/$D/.zshrc)
	(echo "zstyle ':completion:*' verbose yes" >> /usr/home/$D/.zshrc)
	(echo 'touch ~/.zsh_include' >> /usr/home/$D/.zshrc)
	(echo 'touch ~/.art' >> /usr/home/$D/.zshrc)
	(echo 'touch ~/.histfile' >> /usr/home/$D/.zshrc)
	(echo 'HISTFILE=~/.histfile' >> /usr/home/$D/.zshrc)
	(echo 'HISTSIZE=1000' >> /usr/home/$D/.zshrc)
	(echo 'SAVEHIST=1000' >> /usr/home/$D/.zshrc)
	(echo 'export EDITOR=ee' >> /usr/home/$D/.zshrc)
	(echo "alias ei='ee -i'" >> /usr/home/$D/.zshrc)
	(echo "alias ll='ls -l'" >> /usr/home/$D/.zshrc)
	(echo "alias la='ls -a'" >> /usr/home/$D/.zshrc)
	(echo "alias sudi='sudo -i'" >> /usr/home/$D/.zshrc)
	(echo "alias zshrc='ee ~/.zshrc'" >> /usr/home/$D/.zshrc)
	(echo "alias screen='screen -R'" >> /usr/home/$D/.zshrc)
	(echo "alias clear='clear && source ~/.zshrc'" >> /usr/home/$D/.zshrc)
	(echo "alias add='git add --all'" >> /usr/home/$D/.zshrc)
	(echo "alias commit='git commit -a'" >> /usr/home/$D/.zshrc)
	(echo "alias status='git status'" >> /usr/home/$D/.zshrc)
	(echo "alias projectSize='git ls-files | xargs wc -l'" >> /usr/home/$D/.zshrc)
	(echo "alias branch='git branch'" >> /usr/home/$D/.zshrc)
	(echo '$(which cat) ~/.art' >> /usr/home/$D/.zshrc)
	(echo '$(which fortune) -s 2> /dev/null' >> /usr/home/$D/.zshrc)
	(echo 'RED=$' "'" "\\" '033[38;5;167m' "'" | tr -d ' ' >> /usr/home/$D/.zshrc)
	(echo 'GREEN=$' "'" "\\" '033[38;5;71m' "'" | tr -d ' ' >> /usr/home/$D/.zshrc)
	(echo 'YELLOW=$' "'" "\\" '033[38;5;228m' "'" | tr -d ' ' >> /usr/home/$D/.zshrc)
	(echo 'parse_git_branch () { git branch 2> /dev/null | grep "*" | sed -e "s/* \(.*\)/ (\1)/g" }' >> /usr/home/$D/.zshrc)
	(echo 'function precmd() { export PROMPT="%{$GREEN%}%~%{$YELLOW%}$(parse_git_branch)%{$RED%}> %{$GREEN%}" }' >> /usr/home/$D/.zshrc)
	(echo 'PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH' >> /usr/home/$D/.zshrc)
	(echo 'source ~/.zsh_include' >> /usr/home/$D/.zshrc)
done
 
case "$*" in
	*--full*)
		portsnap fetch extract
		if [ ! -d /usr/src/.svn ] ; then
			svn co $SVN_URL /usr/src
		fi
	;;
 
	*--src*)
		if [ ! -d /usr/src/.svn ] ; then
			svn co $SVN_URL /usr/src
		fi
	;;
 
	*--ports*)
		portsnap fetch extract
	;;
esac
 
case "$*" in
	*--kern*)
		ARCH=`uname -m`
		KNAME = `echo 'CUSTOM'`
 
		if [ ! -L /sys ] ; then
		   ln -s /usr/src/sys /sys #this need to be conditional
		fi
 
		cp /usr/src/sys/$ARCH/conf/GENERIC /usr/src/sys/$ARCH/conf/$KNAME
 
		if [ ! -d /usr/src/.svn ] ; then
		   svn co $SVN_URL /usr/src
		fi
 
		touch /usr/local/bin/kern_build
		touch /usr/local/bin/kern_install
		chmod a+x /usr/local/bin/kern_build
		chmod a+x /usr/local/bin/kern_install
 
		echo '' > /usr/local/bin/kern_build
		echo 'cd /usr/src && ee /usr/src/sys/'$ARCH'/conf/'$KNAME && 'svn update /usr/src && make buildkernel KERNCONF='$KNAME >> /usr/local/bin/kern_build
 
		echo '' > /usr/local/bin/kern_install
		echo 'cd /usr/src && mv /boot/kernel /boot/kernel.old && make installkernel KERNCONF='$KNAME >> /usr/local/bin/kern_install
	;;
esac
 
case "$*" in
	*--wireless*)
		pkg install -y wifimgr
		if ! grep 'if_ath_load' /boot/loader.conf ;then
			echo 'if_ath_load="YES"' >> /boot/loader.conf
		fi
 
		if ! grep 'if_wi_load' /boot/loader.conf ;then
			echo 'if_wi_load="YES"' >> /boot/loader.conf
		fi
 
		if ! grep 'wlan_wep_load' /boot/loader.conf ;then
			echo 'wlan_wep_load="YES"' >> /boot/loader.conf
		fi
 
		if ! grep 'wlan_ccmp_load' /boot/loader.conf ;then
			echo 'wlan_ccmp_load="YES"' >> /boot/loader.conf
		fi
 
		if ! grep 'wlan_tkip_load' /boot/loader.conf ;then
			echo 'wlan_tkip_load="YES"' >> /boot/loader.conf
		fi
 
		if ! grep 'wlans_ath0' /etc/rc.conf ;then
			echo 'wlans_ath0=wlan0' >> /etc/rc.conf
		fi
 
		if ! grep 'ifconfig_wlan0' /etc/rc.conf ;then
			echo 'ifconfig_wlan0="WPA DHCP"' >> /etc/rc.conf
		fi
	;;
esac
 
case "$*" in
	*--nvidia*) #not tested
		pkg install -y x11/nvidia-driver x11/nvidia-xconfig x11/nvidia-settings
		if ! grep 'nvidia_load' /boot/loader.conf ;then
			echo 'nvidia_load="YES"' >> /boot/loader.conf
		fi
		nvidia-xconfig #use this to update the xorg.conf file
	;;
 
	*--virtual-box*)
		pkg install -y virtualbox-ose-additions
 
		if ! grep 'vboxguest_enable' /etc/rc.conf ;then
			echo 'vboxguest_enable="YES"' >> /etc/rc.conf
		fi
 
		if ! grep 'vboxservice_enable' /etc/rc.conf ;then
			echo 'vboxservice_enable="YES"' >> /etc/rc.conf
		fi
 
		if ! grep 'vboxservice_flags' /etc/rc.conf ;then
			echo 'vboxservice_flags="--disable-timesync"' >> /etc/rc.conf
		fi
	;;
esac
 
/usr/libexec/locate.updatedb
#security risk, sure but it's a desktop
 
case "$*" in
	*--reboot*)
		reboot
	;;
esac
