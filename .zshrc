export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

ENABLE_CORRECTION="true"

plugins=(
	git
	zsh-autosuggestions
    zsh-completions
	zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Pronmpt configuration

function dir_icon {
	if [[ "$PWD" == "$HOME" ]]; then
		echo "%B%F{blue}%f%b"
	else
		echo "%B%F{cyan}%f%b"
	fi
}

function parse_git_branch {
	local branch
	branch=$(git symbolic-ref --short HEAD 2> /dev/null)
	if [ -n "$branch" ]; then
		echo " [$branch]"
	fi
}

PROMPT='%F{cyan} %f %F{magenta}%n%f $(dir_icon) %F{blue}%~%f%${vcs_info_msg_0_} %F{yellow}$(parse_git_branch)%f %(?.%B%F{green}.%F{red})%f%b '

# Integración de fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

export PATH=$HOME/.config/rofi/scripts:$PATH

# Alias configuration
alias 'rofi -show drun'='launcher_t7'

alias fzfbat='fzf --preview="bat --theme=base16 --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=base16 --color=always {}")'

export LESSOPEN="| /usr/bin/lesspipe.sh %s"


# bun completions
[ -s "/home/aslan/.bun/_bun" ] && source "/home/aslan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
