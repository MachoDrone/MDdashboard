#!/bin/bash
# Automatically start Nosana Node on tty1 for Ubuntu Server
# For Ubuntu Desktop, the GUI is likely already on tty1, so this project has a fork named autonosnode2.sh which auto starts Nosana node on tty2.
# Starting on tty2 may be convenient for Ubuntu Desktop, but it is highly recommended to run from a terminal in the GUI for ease of screencaptures / support.

# The objective of this script is to automatically launch Nosana Node on Ubuntu Server 22.04.
# It will resmble operation of the node as if the user manually logged-in and ran the Nosana node start script in the cli.
# This will be 100% familiar to a novice owner/operator who may already be doing the manual tasks.
# Before running this script, the user will need to type the command: chmod +x autonosnode1.sh

# To take full advantage of this script, users will need to edit the BIOS of their PC to automatically restart the PC after power is reapplied.
# e.g. after an outage with their mains utility/power company.

#./autonosnode1.sh
# The objective of this script is to automatically launch Nosana Node on Ubuntu Server 22.04
# It will resmble operation of the node as if the user manually logs-in and runs the Nosana start script.
# This will be 100% familiar to a novice owner/operator who may already be doing the manual tasks.

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

# Function to append start script to .profile
append_start_script() {
    # Append the start script for the Nosana node to .profile
#    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then\n     bash <(wget -qO- https://nosana.io/testgrid.sh)\n fi\n' >> .profile
#    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty2 ]]; then\n     bash <(wget -qO- https://nosana.io/testgrid.sh)\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty5 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty6 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty7 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty8 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty9 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty10 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty11 ]]; then\n     echo hello\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n     echo hello\n fi\n' >> .profile
}

# Function to configure autologin for tty1
configure_autologin() {
    # Create the directory for systemd service override
#    mkdir -p /etc/systemd/system/getty@tty1.service.d/
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

    # Set up autologin in override.conf
#    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty2.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty3.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty4.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty5.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty6.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty7.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty8.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty9.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty10.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty11.service.d/override.conf >/dev/null
    printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" | sudo tee /etc/systemd/system/getty@tty12.service.d/override.conf >/dev/null
}

# Function to edit /etc/systemd/logind.conf to enable autologin
edit_logind_conf() {
    # Remove the "#" from "#NAutoVTs=" to enable autologin
    sudo sed -i 's/^#NAutoVTs=/NAutoVTs=/' /etc/systemd/logind.conf
}

# Function to uninstall the script
#uninstall_script() {
#    echo "Uninstalling the script..."
#    # Remove the appended lines from .profile
#    sed -i '/# Launch Nosana node start script/,/# End of Nosana node start script/d' .profile
#    # Remove the autologin configuration
#    sudo rm -rf /etc/systemd/system/getty@tty1.service.d/
    # Revert changes in logind.conf
#    sudo sed -i 's/^NAutoVTs=/#NAutoVTs=/' /etc/systemd/logind.conf
#    echo "Script uninstalled successfully."
#}

# Check if the script is being run with sudo
# if [ "$(id -u)" != "0" ]; then
#    echo "*** This script must be run with sudo. Exiting... ***" >&2
#    exit 1
#fi

# Ask for confirmation under the box
draw_box
read -p "Do you want to proceed? (y/n): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Exiting..."
    exit 0
fi

# Check if the script has already been run so it offers to uninstall
#if grep -q "# Launch Nosana node start script" .profile; then
#    echo "The script has already been run."
#    read -p "Would you like to uninstall the script? (y/n): " choice
#    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
#        uninstall_script
#    else
#        echo "Exiting..."
#        exit 0
#    fi
#else
#if 1+1=2 
    append_start_script
    configure_autologin
    edit_logind_conf
    echo "Script installed successfully."
#fi

# Instruct user to reboot to test, store script
echo .
echo .
lsb_release -a
echo .
echo .
echo "tested on Ubuntu Server 22.04 jammy"
echo .
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━.━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃                                                            ┃"
echo "┃    Store this script. It is the Installer & Uninstaller    ┃"
echo "┃  Both simply use the same command:  sudo ./autonosnode1.sh ┃"
echo "┃                                                            ┃"
echo "┃ *In your PC's BIOS, setup auto-boot when power is applied* ┃"
echo "┃                                                            ┃"
echo "┃                                                            ┃"
echo "┃         You may now test results with sudo reboot          ┃"
echo "┃                                                            ┃"
echo "┃                                                            ┃"
echo "┃   by MachoDrone                               v0.240517    ┃"
echo "┃                                                            ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━.━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
