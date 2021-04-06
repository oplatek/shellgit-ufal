# Tips, tricks and docs for using Ufal cluster

## Installation ##
See bin/setting_env.sh

To install the settings, clone (readonly) this repository:

```bash
git clone git@gitlab.com:oplatek/shellgit-ufal.git ~/shellgit-ufal
cp -r ~/shellgit-ufal/.git ~/.shellgit-ufal.git
alias ufalgit='git --git-dir=$HOME/.shellgit-ufal.git/ --work-tree=$HOME'
cd $HOME; ufalgit checkout .  # DANGEROUS ;-)
```


To browse source code go to https://gitlab.com/oplatek/shellgit-ufal

### Stores ###

* bashrc_local
* qsub scripts
* ssh client startup scripts

### SSH to ufal servers and in between machine

See `/etc/ssh/sshd_config`. The authorised key are located in `/home/ETC/$USER/.ssh`.

I just symlink the default folder files there

```
$ pwd
/home/ETC/oplatek/.ssh

$ l
total 2
lrwxrwxrwx 1 oplatek ufal 34 Apr  6 15:07 authorized_keys -> /home/oplatek/.ssh/authorized_keys                                                                           
lrwxrwxrwx 1 oplatek ufal 25 Apr  6 15:07 id_rsa -> /home/oplatek/.ssh/id_rsa                                                                                             
lrwxrwxrwx 1 oplatek ufal 29 Apr  6 15:07 id_rsa.pub -> /home/oplatek/.ssh/id_rsa.pub                                                                                     
```

### Credits
I use settings and tips (with permission) from other people including:
- Ondřej Dušek
- Ondřej Bojar
- Jan Vainer

Thanks to them, and complain for possible errors to me.
