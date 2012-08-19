# .bash_profile

# User specific environment and startup programs

alias ll='ls -lGa'
alias d='ll'
alias p="cd ~/projects"
alias g="git"
alias gp="git push;alert 'thanks for the push, asshole!'"
alias v="vim"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias s="cd .."

alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

source ~/.git-completion.bash

# export PS1="\u@\h\w$ "
function git_prompt {
	local STATUS=`git status 2>&1`
    	if [[ "$STATUS" != *'Not a git repository'* ]]
      	then
          	if [[ "$STATUS" == *'working directory clean'* ]]
	      	then
	        	echo -e "\e[0;32m$(__git_ps1)\e[m"
		else
			echo -e "\e[0;31m$(__git_ps1)\e[m"
		fi
	fi
}

c='4';
symhost='lenovo'

# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34\]\w\[\033[00\]$(git_prompt):\n> '
PS1='\n\[\e[0;3${c}m\]\u\[\e[0m\]@\[\e[1;3${c}m\]${symhost}\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\] $(git_prompt):\n> '



PS2='> '
PS4='+ '


