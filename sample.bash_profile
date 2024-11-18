# /etc/bashrc
# System wide functions and aliases
# Environment stuff goes in /etc/profile
# modifications by <cdgrieb@umich.edu> for LSA environment 
# 

# 
# ADDED FUNCTIONALITY FOR *.bash script under '/etc/profile.d'
# <cdgrieb> 03-03-2009
# <also need to combine the below listed logic>
# 
for i in /etc/profile.d/*.sh 
do
	if [ -r "$i" ]; then
		. $i
	fi
done
unset i

for i in /etc/profile.d/*.bash
do
	 if [ -r "$i" ]; then
               . $i
         fi
done
unset i

alias dec='cl ~/Dropbox/dec'
alias dx='cl ~/Dropbox'
alias bx='cl ~/Box'
alias rd='cl ~/Dropbox/research'
alias sd='cl ~/Dropbox/students'
alias stda='cl ~/rio_ar_fit/Rio_State_Spatpomp_Fitting/applied-paper'
alias d531='cl ~/git/531w24'
alias a531='cl ~/Dropbox/531'
alias d810='cl ~/git/810f24'
alias a810='cl ~/Dropbox/810'

alias gd='cl ~/Dropbox/grant'
alias dd='cd ~/Downloads ; ls'

alias spd='cd ~/git/spatPomp ; ls'
alias spp='cd ~/git/spatPomp-paper ; ls'
alias joss='docker run --rm -it  -v $PWD:/data  -u $(id -u):$(id -g)  openjournals/inara  -o pdf,crossref paper.md'

alias mpd='cl ~/git/metapop'
alias dpd='cl ~/git/diffPomp/paper'
alias mpr='cl ~/git/metapoppkg'
alias hrd='cl ~/git/haiti_revision'
alias mpw='cl ~/git/metapop-work'
alias doob='ssh -Y ionides@doob.stat.lsa.umich.edu'
alias glk='ssh -Y ionides@greatlakes.arc-ts.umich.edu'
db="doob.stat.lsa.umich.edu"
gl="greatlakes.arc-ts.umich.edu"
#alias eb='/Applications/Emacs.app/Contents/MacOS/Emacs ~/.bash_profile &'
alias eb='emacs ~/.bash_profile -font 10x20&'
alias sb='source ~/.bash_profile'
alias sd='cl ~/Dropbox/students'
alias fd='cl ~/Dropbox/family'
alias td='cl ~/Dropbox/talk'
alias hd='cl ~/Dropbox/dept/hiring'
alias cod='cl ~/Dropbox/computing'
alias ppf='cl ~/fork/panelPomp'
alias pp='cl ~/panelPomp'
alias ppd='cl ~/git/panelpompjss'
alias dup='cl ~/Dropbox/dup'
alias pyd='cl ~/git/pypomp'
alias daph='cl ~/git/Daphnia/daphnia-article'

# alias st='source ~/.tcshrc'

alias x='/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal &'

alias et=e
complete -f -X "!*.tex" et

alias a='open'
complete -f -X "!*.pdf" a
# a () { /Applications/Preview.app/Contents/MacOS/Preview "$*" & }
bg () { grep -e "$*" ~/git/bib/*.bib ; }
alias bd='cl ~/git/bib'
alias b='bibtex'
complete -f -X "!*.tex" bibtex
complete -f -X "*.tex" b
alias p='pdflatex'
complete -f -X "!*.tex" pdflatex
complete -f -X '!*.tex' p
#alias e='open'
#alias em='nohup /Applications/Emacs.app/Contents/MacOS/Emacs -q &'
#alias emm='/Applications/Aquamacs\ Emacs.app/Contents/MacOS/Aquamacs\ Emacs'
#complete -G "*.tex" e
alias enw='emacs'
alias o='open'
complete -f -X "!*.html" o

alias R64='/Applications/R64.app/Contents/MacOS/R'
alias clean='rm *.log ; rm *.dvi ; rm *.aux ; rm *.bbl ; rm *.blg ; rm *.d ; rm *.toc ; rm *.out ; rm *.nav ; rm *.snm ; rm *4up.ps ; rm *.spl ; rm *~ ; ls'


# e () { /Applications/Emacs.app/Contents/MacOS/Emacs "$*" & }
# e () { emacs "$*" -g 120x48+300+100 -font 10x20 & }
e () { emacs "$*" -font 10x20 & }
alias et='e'
complete -f -X "!*.tex" et
alias er='e'
complete -f -X "!*.Rnw" er

m () { more "$*"  ; }
cl () { cd "$*"  ; ls ; }

alias md2='mv ~/Downloads'
alias mk='make'
complete -f -X "!*.pdf" mk
alias lo='logout'

export PATH=$PATH:/Applications/RStudio.app/Contents/MacOS/pandoc

export PATH=/usr/local/opt/qt/bin:$PATH

alias gitlog='git log --graph --abbrev-commit --decorate --all'
gitls () { git diff-tree  --name-status -r @{$*} master ; }
alias gst='git status'
alias log='git log'
alias gam='git commit -am'
alias g='cl ~/git'
alias push='git push'
alias pull='git pull'
alias log='git log'

alias ri='R CMD INSTALL .'

eval "$(/opt/homebrew/bin/brew shellenv)"


_md()
{
    local DOWNLOADS_DIR=$HOME/Downloads
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$DOWNLOADS_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $DOWNLOADS_DIR/$file ]]; then
            file=$file/
        fi
        COMPREPLY[i]=$file
    done
}
md() { cwd=$PWD ; cd ~/Downloads ; mv $* $cwd ; cd $cwd ; }
complete -F _md -o nospace md


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

