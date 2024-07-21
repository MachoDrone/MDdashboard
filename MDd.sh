#!/bin/bash

# no reboot required for passwordless sudo

# Installer: wget -qO - https://raw.githubusercontent.com/MachoDrone/MDdashboard/main/MDd.sh | sudo bash
# wget -qO MDd.sh 'https://raw.githubusercontent.com/MachoDrone/MDdashboard/main/MDd.sh' && sudo bash MDd.sh

# Function to show current OS version and draw a box with introduction message
echo .
echo "lsb_release -a (show current version of Ubuntu Server)"
echo .
lsb_release -a
echo .
echo .
echo "tested on Ubuntu Server 22.04 jammy"
echo .
echo PRESS ctrl-c TO CANCEL, PRESS ANY KEY TO CONTINUE, OR SCRIPT WILL BEGIN IN ONE MINUTE ...
echo .
    echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo "┃  by MachoDrone                                                v0.240711  ┃"
    echo "┃                                                                          ┃"
    echo "┃    This script will prepare autologin for Nosana node on tty2-tty6       ┃"
    echo "┃                                                                          ┃"
    echo "┃ **THIS IS FOR Ubuntu Server (non-GUI), NOT FOR WSL2 nor Ubuntu Desktop** ┃"
    echo "┃                                                                          ┃"
    echo "┃      It will perform the following actions:                              ┃"
    echo "┃          1. Append the Nosana node start script to .profile              ┃"
    echo "┃          2. Configure and activate autologin for tty1-tty12              ┃"
    echo "┃          3. Edit /etc/systemd/logind.conf to enable autologin            ┃"
    echo "┃                                                                          ┃"
    echo "┃ THERE IS NO UNINSTALLER,  I RECOMMEND TO INSTALL ON FRESH UBUNTU INSTALL ┃"
    echo "┃             This has been tested on Ubuntu Server 22.04                  ┃"
    echo "┃                                                                          ┃"
    echo "┃                                                                          ┃"
    echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo .
read -t 60 -p "PRESS ctrl-c TO CANCEL, PRESS ANY KEY TO CONTINUE, OR SCRIPT WILL BEGIN IN ONE MINUTE ..."
echo .

sudo apt update

# Append start commands to .profile
append_start_script() {
    # Append the start script for the Nosana node to .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then\n     chvt 3\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then\n     exit\n fi\n' >> .profile
#    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty2 ]]; then\n     chvt 3\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     chvt 4\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     rm -f MDd.sh\n fi\n' >> .profile    
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     ./glances.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty3 ]]; then\n     ls *.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then\n     chvt 5\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then\n     ./tpsview.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then\n     ls *.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty5 ]]; then\n     chvt 6\n fi\n' >> .profile 
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty5 ]]; then\n     ./startnode.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty5 ]]; then\n     ls *.sh\n fi\n' >> .profile 
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty6 ]]; then\n     chvt 7\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty6 ]]; then\n     ./nvitop.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty6 ]]; then\n     ls *.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty7 ]]; then\n     chvt 8\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty7 ]]; then\n     ls *.sh\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty7 ]]; then\n     echo "type ./nvtop.sh"\n fi\n' >> .profile

# setup vnc sessions
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty8 ]]; then\n     chvt 9\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty8 ]]; then\n     sudo linuxvnc 3 -rfbport 5903 -rfbportv6 5903\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty9 ]]; then\n     chvt 10\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty9 ]]; then\n     sudo linuxvnc 4 -rfbport 5904 -rfbportv6 5904\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty10 ]]; then\n    chvt 11\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty10 ]]; then\n    sudo linuxvnc 5 -rfbport 5905 -rfbportv6 5905\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty11 ]]; then\n    chvt 12\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty11 ]]; then\n    sudo linuxvnc 6 -rfbport 5906 -rfbportv6 5906\n fi\n' >> .profile
#    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n    chvt 5\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n    ls\n fi\n' >> .profile
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n    sudo systemctl start gdm3\n fi\n' >> .profile 
    printf '\n # Launch Nosana node start script\n if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty12 ]]; then\n    sudo linuxvnc 7 -rfbport 5907 -rfbportv6 5907\n fi\n' >> .profile
}

# Configure autologin for tty1-tty12
configure_autologin() {
    # Create the directory for systemd service override
    sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
#    sudo mkdir -p /etc/systemd/system/getty@tty2.service.d/
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
#    sudo printf "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $SUDO_USER %%I \$TERM\nType=idle\n" > /etc/systemd/system/getty@tty2.service.d/override.conf
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

# Edit sudoer for passwordless sudo
# sudoers entry
# Configure autologin for tty1-tty12
passwordless_sudo() {
sudoers_entry="$SUDO_USER ALL=(ALL) NOPASSWD:ALL"

# add the entry to sudoers using a temp file
temp_file=$(mktemp)
sudo cp /etc/sudoers $temp_file
echo "$sudoers_entry" | sudo tee -a $temp_file > /dev/null

# validate the sudoers file
sudo visudo -c -f $temp_file
if [ $? -eq 0 ]; then
    sudo cp $temp_file /etc/sudoers
    echo "Sudoers file updated successfully."
else
    echo "Error: Invalid sudoers file. Changes were not applied."
fi
# clean up temp file
rm $temp_file
}

# Main script execution
# draw_box
## read -p "Do you want to proceed? (y/n) " choice
## if [[ "$choice" =~ ^[Yy]$ ]]; then
    append_start_script
    configure_autologin
    edit_logind_conf
#    passwordless_sudo

sudo apt update

# Install nano
sudo apt install nano

# Install linuxvnc
sudo apt install linuxvnc -y

# Install nvitop (this is not nvtop)
sudo apt install python3-pip -y
sudo apt install git -y
git clone --depth=1 https://github.com/XuehaiPan/nvitop.git
cd nvitop
pip3 install . --no-color
pip3 install -r requirements.txt --no-color
cd /home/$SUDO_USER
printf "\n#!/bin/sh\ncd nvitop\npython3 -m nvitop --monitor auto --colorful\ncd ..\n" > /home/$SUDO_USER/nvitop.sh
chmod +x /home/$SUDO_USER/nvitop.sh

# Install nvtop (this is not nvitop)
sudo apt install nvtop
printf "\n#!/bin/sh\nnvtop\n" > /home/$SUDO_USER/nvtop.sh
chmod +x /home/$SUDO_USER/nvtop.sh

# Install glances
wget -O- https://bit.ly/glances | /bin/bash
printf "\n#!/bin/sh\nglances\n" > /home/$SUDO_USER/glances.sh
chmod +x /home/$SUDO_USER/glances.sh

# Create startscript for node
printf "#!/bin/sh\nbash <(wget -qO- https://nosana.io/testgrid.sh)\n" > /home/$SUDO_USER/startscript.sh
chmod +x /home/$SUDO_USER/startscript.sh

# Install Tokens per second monitor
printf '\n#!/bin/sh\nclear\ngrep "Results for qwen:7b" .nosana/flows.json\necho updates every 60 seconds\nsleep 60\n./tpsview.sh\n' > /home/$SUDO_USER/tpsview.sh
chmod +x /home/$SUDO_USER/tpsview.sh

mkdir .nosana
#nano .nosana/nosana_key.json


# Check if the script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Backup the existing custom.conf file
if [ -f /etc/gdm3/custom.conf ]; then
  cp /etc/gdm3/custom.conf /etc/gdm3/custom.conf.bak
  echo "Backup of custom.conf created at /etc/gdm3/custom.conf.bak"
fi

# Modify /etc/gdm3/custom.conf
echo "Modifying /etc/gdm3/custom.conf to set FirstVT=2..."

# Check if the [daemon] section already exists
if grep -q '^\[daemon\]' /etc/gdm3/custom.conf; then
  # Add or replace the FirstVT setting in the [daemon] section
  sed -i '/^\[daemon\]/,/^\[.*\]/ {/^\[daemon\]/! {/FirstVT=/d}}' /etc/gdm3/custom.conf
  sed -i '/^\[daemon\]/a FirstVT=2' /etc/gdm3/custom.conf
else
  # Add the [daemon] section and the FirstVT setting at the end of the file
  echo -e "\n[daemon]\nFirstVT=2" >> /etc/gdm3/custom.conf
fi

echo "Configuration updated."

# Set the default target to multi-user.target
echo "Setting default target to multi-user.target..."
systemctl set-default multi-user.target

# Restart the system
echo "Configuration complete. Please reboot the system to apply changes."

# exit 0

# Install openssh-server
sudo apt install openssh-server -y
    
    passwordless_sudo
    
systemctl get-default
sudo systemctl set-default multi-user.target
sudo systemctl reboot
