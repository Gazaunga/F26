#!/bin/bash

# Create new web project folder and grab html5 boilerplate
website() {
mkdir $1
cd $1
git init
git remote add origin https://github.com/Gazaunga/HTML5-Boilerplate.git
git pull origin master
ls -a
$EDITOR index.html
}

# List contents after cd
cd()
{
 builtin cd "$*" && ls
}

# Create a new directory and enter it
mkd() { mkdir $1 && cd $1; }

gacp () {
  git add --all --verbose
  git commit -m "$1"
  git push -u origin HEAD
}

## Interesting bash function for setting up a new front-end project
# Usage: new_project DIRNAME DESCRIPTION
function new_project() {
  git init "$1" && \
	  pushd "$1" && \
	  echo "$2" > README.txt && \
	  echo "$2" > .git/description && \
	  echo "/node_modules/" >> .gitignore && \
	  hub create -d "$2" && \
	  yarn init && \
	  gacp initial
}

gitgraph() {
git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all

: '
* ca425d6 - Thu, 25 Feb 2016 21:40:28 -0800 (5 months ago) (HEAD -> develop, origin/develop, origin/HEAD)
|  Bump version, update contributors list - Jeremy Felt
*   8dfffb4 - Thu, 25 Feb 2016 21:31:48 -0800 (5 months ago)
|\   Merge pull request #813 from tucsonlabs/chore/update-optimize-power-parallels-provider-flag - Jeremy Felt
| * fb9f5e3 - Tue, 19 Jan 2016 04:37:17 -0800 (6 months ago)
| |  update deprecated parallels.optimize_power_consumption = false - Erik Trom
* | d170f3f - Sun, 21 Feb 2016 11:46:00 -0800 (5 months ago)
| |  Adjust heading for Bug fixes and enhancements - Jeremy Felt
| | * 9226f5b - Sun, 21 Feb 2016 11:46:00 -0800 (5 months ago) (tag: 1.3.0, origin/master)
| | |  Adjust heading for Bug fixes and enhancements - Jeremy Felt
| | *   2e9eec5 - Sun, 21 Feb 2016 11:42:54 -0800 (5 months ago)
| | |\   Merge branch ''develop'' - Jeremy Felt
| |_|/  
|/| |   
* | |   ba6058b - Sun, 21 Feb 2016 10:52:28 -0800 (5 months ago)
|\ \ \   Merge pull request #832 from Varying-Vagrant-Vagrants/update-docs - Jeremy Felt
| * | | 99d2772 - Sun, 21 Feb 2016 10:36:17 -0800 (5 months ago)
| | | |  Update release date for 1.3.0 - Jeremy Felt
'
}

fedup() {
sudo dnf -y update
sudo dnf upgrade --assumeyes --refresh
sudo dnf -y install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --assumeyes --refresh --allowerasing --releasever=$1
sudo dnf system-upgrade --assumeyes reboot
dnf clean all
dnf distro-sync
dnf history >> dnf.log 2>&1
reboot
}
