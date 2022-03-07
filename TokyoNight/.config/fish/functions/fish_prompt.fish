function fish_prompt
    echo -n (prompt_pwd) '$ '
end

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    set_color red --bold
    printf "["
    set_color yellow
    printf "%s" "$USER"
    set_color green
    printf "@"
    set_color blue
    printf "%s" "$hostname"
    set_color magenta
    printf " %s" "$PWD"
    set_color red
    printf "] "
    set_color normal
end
