export PATH="$PATH:$HOME/Elixir_1.6/bin/"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function branchify { 
# Check out a new branch and reset the current branch back one commit
git branch $1 && git reset --hard  HEAD~ && git checkout $1
 }
export PATH="/usr/local/opt/libpq/bin:$PATH"
