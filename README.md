dotfiles-template
=================

Use this repository as a template for your own personal "dotfiles" repository, if you don't already have one.  If you do, you can reference the files and file structure to make your existing dotfiles repository work with the Daptiv Strap scripts.

# Instructions
There are more than a few ways to use this repository.  If you don't have a dotfiles repository already, then the instructions below are fine.  If you do have a personal dotfiles repository, it's probably best to ignore these instructions and treat this repository as "inspiration" for the changes you'll need to make.  At the end, you need to have the **Important Files** in your personal dotfiles repository so that the Daptiv Strap process can work.

* Clone this repository in order to get a copy of it locally.
* If you don't have a dotfiles repository already, then:
*  Create repository in your github account named `dotfiles`, but don't clone it.
*  Now, run these commands:

```bash
git clone https://github.com/daptiv/dotfiles-template.git ~/.dotfiles
cd ~/.dotfiles
rm -rf .git/
echo "My personal dotfiles" > ./README.md
git init
git remote add origin git@github.com:{your-github-username}/dotfiles.git
git add *
git commit -a -m "Initial commit"
git push -u origin HEAD
```

## Important Files
`.Brewfile`

Strap will look for a `.Brewfile` in the root of your dotfiles repository (`~/.dotfiles/.Brewfile`).  If it finds it, it will symlink it to your personal root folder, and then install all brew packages and casks referenced in it.

`script/setup`

Strap will call this script, if it exists, to perform personalized setup steps.  You can use it configure the projects and virtual machines installed on your Mac, call out from here to other scripts, other repos, etc.

`script/postbrew`

Strap will look for this file in `script/postbrew`, and it will run it as the very last step of the Strap process.

`.bash_profile`

This is your personal bash profile.  The daptiv `.bash_profile` file will source your personal `.bash_profile` file, if it exists in `~/.dotfiles/.bash_profile`

.gitconfig

This is your personal .gitconfig file. Strap will symlink this to your home folder.
