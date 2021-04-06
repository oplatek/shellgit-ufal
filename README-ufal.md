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
