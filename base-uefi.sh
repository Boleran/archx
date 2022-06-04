#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
# echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:arch123 | chpasswd

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils cups cups-pdf imagescan system-config-printer simple-scan alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector firewalld sof-firmware os-prober ntfs-3g fish kitty virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak nss-mdns xfsprogs btrfsprogs ncdu xf86-video-amdgpu xf86-video-ati wget neofetch dina-font tamsyn-font ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols ttf-font-awesome ttf-fira-code
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ARCHGRUB

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
#systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd
systemctl enable avahi-daemon
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
#systemctl enable reflector.timer
#systemctl enable fstrim.timer
#systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -maG wheel segara
echo segara:geger | chpasswd

echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




