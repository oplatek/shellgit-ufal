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
For demos there virtual servers running behind quest for me they are: namuddis, demo and nlg appearing as e.g.
https://quest.ms.mff.cuni.cz/nlg/factgenie/

Onee can backup files to ATLAS server https://wiki.ufal.ms.mff.cuni.cz/internal:linux-network#atlas-archive-server

Alara is Odusek's desktop where custom based software may be installed `elara.n.mff.cuni.cz`.

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

Useful tmux tips
- see bin/tmux_attach.sh
- `pkill -USR1 tmux` for attaching to sessions which are no longer visible/accessible. More at
  https://ufal-mff-uk.slack.com/archives/C04AUS6FBG8/p1733214273985899?thread_ts=1733213961.826629&cid=C04AUS6FBG8. If
  you tell us why it works let us know ;-)

### Credits
I use settings and tips (with permission) from other people including:
- Ondřej Dušek
- Ondřej Bojar
- Jan Vainer
- Tomas Nekvinda
- Zdenek Kasner

Thanks to them, and complain for possible errors to me.
