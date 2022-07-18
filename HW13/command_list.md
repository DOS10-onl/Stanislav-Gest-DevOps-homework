# network
* ping 
* ping -c 
* nslookup 
* dig .
* dig onliner.by mx
* traceroute
* telnet
* netcat https://ru.joecomp.com/netcat-command-with-examples

# logrotate
* /etc/logrotate.d/...

# disk
* lsblk -f
* mkfs -t xfs /dev/xvdb
* /etc/fstab

*iostat

# files\folders
* mkdir
* touch
* rm \ rmdir
* cp \ mv
* cat \ less
* tail -f \ head

# grep\sed\awk
* grep -c = count
* grep -i = case insensitive
* grep -v "#" = invert
* grep -e 
echo "bog bag cog cot tog log lag" | grep -E -o '[a-z]og'

* sed 's/19:31:[0-59]/QWE/' syslog

* sed -n 's/test/another test/p' myfile Флаг p указывает на то, что нужно вывести содержимое исходной строки.
* sed 's/\/bin\/bash/\/bin\/csh/g' /etc/passwd
* sed 's!/bin/bash!/bin/csh!g' /etc/passwd

* sed 's/test/another test/w output' myfile Флаг вида w file указывает команде на то, что нужно записать результаты обработки текста в файл.
 
 
* awk -F\: '{print $1}' /etc/passwd
* awk -F " " '{print $4}' /var/log/syslog | sort -u
* awk -F: -f {print $1 " home at " $6} /etc/passwd
*  awk '/bin\/bash/ {print $0}' /etc/passwd