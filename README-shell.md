# shellgit is repository for command line settings, especially bash #

## Installation ##
See bin/setting_env.sh
You can clone it (readonly) by:

```bash

	git clone git@gitlab.com:oplatek/shellgit-ufal.git ~/shellgit-ufal.tmp
    cp -r ~/shellgit-ufal.tmp/.git ~/.shellgit-ufal.git
	alias ufalgit='git --git-dir=$HOME/.shellgit-ufal.git/ --work-tree=$HOME'
	cd $HOME; ufalgit checkout .  # DANGEROUS ;-)
```


To browse source code go to https://gitlab.com/oplatek/shellgit-ufal

### Stores ###

* bashrc_local
* qsub scripts
* ssh client startup scripts
