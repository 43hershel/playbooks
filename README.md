# Playbooks
Ansible playbooks for system set-up and provisioning servers and computers.

## Index
- maverick: provisioning and automating a macOS install.
- bagira: provisioning and automating a Linux server install.

**Important note**: This playbook is based on the incredible guide by Jeff Geerling, and many of the roles and base configurations are from him. Check the original guide here: https://github.com/geerlingguy/mac-dev-playbook. Aside from that, I do not encourage copying the playbook or downloading pirated software.  

## maverick
Requirements and my current specifications.

My playbook is based on the M1 13" Macbook Pro. Things are suited for the ARM arquicteture working currently in the lastest build of macOS Ventura. Soon trying a fresh install in macOS Sonoma. Intel build may vary with some configuration. 

### Instructions 
1. Create a local account and sign in to iCloud and Apple Store. 

2. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).

3. Install and upgrade python and ansible. 
    1. Run the following command to add Python 3 to your $PATH: export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
    2. Upgrade Pip: sudo pip3 install --upgrade pip
    3. Install Ansible: pip3 install ansible

