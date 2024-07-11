#!/bin/bash
# passwordless sudo: e.g. `usrnme	ALL=(ALL) NOPASSWD:ALL`  <--replace usrnme with your username
# command: sudo visudo
#
#    #Allow members of group sudo to execute any command
#    %sudo	ALL=(ALL:ALL) ALL
#    usrnme	ALL=(ALL) NOPASSWD:ALL
#
# Installer: wget -qO - https://raw.githubusercontent.com/MachoDrone/test-7-10-24/main/test.sh | sudo bash

# Function to show current OS version and draw a box with introduction message
echo .
echo "lsb_release -a (show current version of Ubuntu Server)"
echo .
lsb_release -a
echo .
echo .
echo "tested on Ubuntu Server 22.04 jammy"
echo .
draw_box() {
    echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo "┃  by MachoDrone                                                v0.240517  ┃"
    echo "┃                                                                          ┃"
    echo "┃                                                                          ┃"
    echo "┃      This script will configure autologin for Nosana node on tty1.       ┃"
    echo "┃                                                                          ┃"
    echo "┃                                                                          ┃"
    echo "┃ **THIS IS FOR Ubuntu Server (non-GUI), NOT FOR WSL2 nor Ubuntu Desktop** ┃"
    echo "┃                                                                          ┃"
    echo "┃      It will perform the following actions:                              ┃"
    echo "┃          1. Append the Nosana node start script to .profile              ┃"
    echo "┃          2. Configure autologin for tty1                                 ┃"
    echo "┃          3. Edit /etc/systemd/logind.conf to enable autologin            ┃"
    echo "┃                                                                          ┃"
    echo "┃      If the script has already been run, it will offer to uninstall.     ┃"
    echo "┃                                                                          ┃"
    echo "┃      Do you want to proceed? (y/n)                                       ┃"
    echo "┃                                                                          ┃"
    echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo .
echo .
}

# Append start commands to .profile
append_start_script() {
    # Append the start script for the Nosana node to .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then\n     chvt 2\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then\n     ls\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty2 ]]; then\n     chvt 3\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty2 ]]; then\n     ls\n fi\n' >> .profile 
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     chvt 4\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     ls\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then\n     chvt 5\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then\n     ls\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty5 ]]; then\n     chvt 6\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty5 ]]; then\n     nvtop\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty6 ]]; then\n     chvt 7\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty6 ]]; then\n     ./nvitop.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty7 ]]; then\n     chvt 8\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty7 ]]; then\n     sudo linuxvnc 1 -rfbport 5901 -rfbportv6 5901\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty8 ]]; then\n     chvt 9\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty8 ]]; then\n     sudo linuxvnc 2 -rfbport 5902 -rfbportv6 5902\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty9 ]]; then\n     chvt 10\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty9 ]]; then\n     sudo linuxvnc 3 -rfbport 5903 -rfbportv6 5903\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty10 ]]; then\n     chvt 11\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty10 ]]; then\n    sudo linuxvnc 4 -rfbport 5904 -rfbportv6 5904\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty11 ]]; then\n     chvt 12\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty11 ]]; then\n    sudo linuxvnc 5 -rfbport 5905 -rfbportv6 5905\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n     chvt 2\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n    sudo linuxvnc 6 -rfbport 5906 -rfbportv6 5906\n fi\n' >> .profile
}

# Configure autologin for tty1-tty12
configure_autologin() {
    # Create the directory for systemd service override
    sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty2.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty3.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty4.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty5.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty6.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty7.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty8.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty9.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty10.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty11.service.d/
    sudo mkdir -p /etc/systemd/system/getty@tty12.service.d/

    # Set up 12 autologin in override.conf files
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty1.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty2.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty3.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty4.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty5.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty6.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty7.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty8.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty9.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty10.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty11.service.d/override.conf
    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty12.service.d/override.conf
}

# Function to edit /etc/systemd/logind.conf to enable 12ttys
edit_logind_conf() {
    # Edit /etc/systemd/logind.conf to enable autologin
    sudo sed -i '/^NAutoVTs/ s/^/# Commented by autonosnode script: /' /etc/systemd/logind.conf
    sudo sed -i '/^#NAutoVTs/ s/^/# Commented by autonosnode script: /' /etc/systemd/logind.conf
    sudo sed -i '/^ReserveVT/ s/^/# Commented by autonosnode script: /' /etc/systemd/logind.conf
    sudo sed -i '/^#ReserveVT/ s/^/# Commented by autonosnode script: /' /etc/systemd/logind.conf
    echo "NAutoVTs=12" | sudo tee -a /etc/systemd/logind.conf
    echo "ReserveVT=13" | sudo tee -a /etc/systemd/logind.conf
}

# Main script execution
# draw_box
# read -p "Do you want to proceed? (y/n) " choice
#if [[ "$choice" =~ ^[Yy]$ ]]; then
    append_start_script
    configure_autologin
    edit_logind_conf

# Install linuxvnc for tty6-tty12
sudo apt install linuxvnc -y

# Install nvitop for tty6
sudo apt install python3-pip -y
git clone --depth=1 https://github.com/XuehaiPan/nvitop.git
cd nvitop
pip3 install .
pip3 install -r requirements.txt
cd ~/

# Create nvitop.sh
printf "cd nvitop\npython3 -m nvitop --monitor auto --colorful\ncd .." > nvitop.sh
chmod +x nvitop.sh

# Install nvtop for tty5
sudo apt install nvtop


#    echo "Setup complete. Please restart your system for changes to take effect."
#else
#    echo "Setup aborted."
#fi
