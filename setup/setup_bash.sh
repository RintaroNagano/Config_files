cd 
curl -o .git-prompt.sh -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o .git-completion.bash -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
chmod +x .git-prompt.sh
chmod +x .git-completion.bash
{
echo "source .git-prompt.sh"
echo "source .git-completion.bash"
echo "GIT_PS1_SHOWDIRTYSTATE=true"
echo "export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]\$(__git_ps1)\[\033[00m\]\$ '" 
} >> .bashrc
rm setup_bash.sh
echo "alias ll='ls -al --color=auto'" >> .bashrc
echo "alias la='ls -a --color=auto'" >> .bashrc
