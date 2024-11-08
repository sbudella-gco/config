# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/go" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

if hash cargo 2>/dev/null; then
    . "$HOME/.cargo/env"
fi

pidof ssh-agent >/dev/null || { 
    eval $(ssh-agent -s)
    for i in .ssh/*.pub; do
    if [[ "$i" =~ "yubico-" ]]; then
        echo "Yubico key PIN is required, you must run this command manually: ssh-add -s /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so"
        continue
    fi
    ssh-add ${i%.*}
    done
}
