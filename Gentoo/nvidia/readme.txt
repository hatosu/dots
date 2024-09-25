STEP 1#
add the modules below to /etc/mkinitcpio.conf
nvidia nvidia_modeset nvidia_uvm nvidia_drm

STEP 2#
add the single line of text below to /etc/modprobe.d/nvidia.conf
options nvidia_drm modeset=1 fbdev=1

STEP 3# run sudo mkinitcpio -P

STEP 4# reboot
