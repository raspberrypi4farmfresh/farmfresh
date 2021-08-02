#
#
#
#   1. Pulls the farmfresh app from bitbucket (git clone https://RaspberryPi4B@bitbucket.org/RaspberryPi4B/farmfresh.git)
#   2. Runs the installation script (sudo /bin/bash ~/Mycodo/install/setup.sh)
#
#   Both of these steps can be done manually if needed. This scripts allows a full installation using one command.
#
#

INSTALL_DIRECTORY=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )

if [ "$EUID" -eq 0 ]; then
    printf "Do not run as root. Run as non-root user: \"/bin/bash %s/install\"\n" "${INSTALL_DIRECTORY}"
    exit 1
fi

if [ -d ~/farmfresh ]; then
  printf "## A ~/farmfresh directory already exists. It will be removed and replaced with a fresh version."
  sudo rm /var/mycodo-root/databases/mycodo.db
  sudo rm -r ~/farmfresh
fi

sudo apt-get install -y jq whiptail python3 git

cd ~
git clone https://RaspberryPi4B@bitbucket.org/RaspberryPi4B/farmfresh.git
cd farmfresh/install
sudo /bin/bash ./setup.sh
