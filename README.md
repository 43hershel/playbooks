# Playbooks
[Ansible](https://www.ansible.com/) playbooks for system set-up and provisioning servers and computers.

## Index
- maverick: provisioning and automating a macOS install.
- bagira: provisioning and automating a Linux server install.

**Important note**: This playbook is based on the incredible guide by Jeff Geerling. Many of the roles and base configurations are taken his playbook and his book [Ansible for DevOps](https://www.ansiblefordevops.com/). Check the original guide [here](https://github.com/geerlingguy/mac-dev-playbook). 
Extra roles can be found in [Ansible Galaxy](https://galaxy.ansible.com/ui/)
Aside from that, I do not encourage copying the playbook or downloading pirated software.   

## maverick - macOS Sonoma 
Requirements and my current specifications.

My playbook is based on the M1 13" Macbook Pro. Things are suited for the ARM arquicteture working currently in the lastest build of macOS Sonoma. Soon trying a fresh install in macOS Sonoma. Intel build may vary with some configuration. 

### Instructions 

Before starting this, make sure you created a user and that you are signed into iCloud.  

1. Install developer tools 
```sh 
xcode-select --install
``` 

2. Change the shell from bash to zsh with the following command: 
```sh
chsh -s /bin/zsh <username>
``` 

3. Then install Oh My Zsh with the following command: 
```sh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
```
**note**: maybe you might need to change the PATH in the `.zhsrc` file

4. Install python, ugprade pip and install ansible. Check [this](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip) guide out. 

5. Install homebrew package manger with the following command: 
I.
```sh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
``` 
II. DON'T FORGET TO EXECUTE THE **LAST 2 COMMANDS** TO ADD THE PATH.


6. Install the requirements with the following command 
```sh
ansible-galaxy install -r requirements.yml
```

7. Execute the `mac_setup.yml` playbook with the following command: 
```sh 
ansible-playbook mac_setup.yml --ask-become-pass
```

8. Add the last files to their places from the `/files` directory.

## hershel - Windows 10/11 
Requirements and my current specifications.

Old Intel i7 4790S with a GTX 745. Anything with Windows 10 + 11 will work no problem. 

### Instructions 
1. Update your system.
2. Go to the Microsoft Store and search for `winget` --> Download the `App Installer` app. 
3. Execute the script with right-click(**note**: the script also contains the download of to Linux ISOs, Fedora and NIX. Use CTRL + C to abort the process as shown in the install script)


