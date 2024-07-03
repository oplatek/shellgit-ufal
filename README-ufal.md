# Tips, tricks and docs for using Ufal cluster

## Installation ##

To install the settings, clone (readonly) this repository:

```bash
git clone git@github.com:oplatek/shellgit-ufal.git ~/shellgit-ufal
cp -r ~/shellgit-ufal/.git ~/.shellgit-ufal.git
alias ufalgit='git --git-dir=$HOME/.shellgit-ufal.git/ --work-tree=$HOME'
cd $HOME; ufalgit checkout .  # DANGEROUS ;-)
```


To browse source code go to https://gitlab.com/oplatek/shellgit-ufal or for stable version to https://github.com/ufal/oplatek-clustershgit.

### Stores ###

* `.bashrc_local` contains
  - qrsh aliases with cuda10.2 and cuda11.1 and compatible machines
  - CUDA setup based based on CUDA Compute Compatability
  - starting ssh-agent (based on Ondrej Dusek scripts)
  - notify function for mail notification
* `./bin/queue.conf` for [queue.pl](https://github.com/kaldi-asr/kaldi/blob/master/egs/wsj/s5/utils/parallel/queue.pl)
  - Useful for Espnet, Kaldi or any custom scripts using job arrays and parallelization on data
* `.forward` and `.sge_request`  - sge related files to mail notifications
    
### Remind myself useful documentation
For demos there virtual servers running behind quest for me they are: namuddis, reprohum and nlg appearing as e.g.
https://quest.ms.mff.cuni.cz/nlg/factgenie/

Onee can backup files to ATLAS server https://wiki.ufal.ms.mff.cuni.cz/internal:linux-network#atlas-archive-server

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
- Tomas Nekvinda

Thanks to them, and complain for possible errors to me.
