function fish_prompt -d "Write out the prompt"
    set_color red --bold
    printf "["

    set_color yellow
    printf "%s" "$USER"
    
    set_color green
    printf "@"

    set_color blue
    printf "%s" "$hostname "
    
    set_color magenta
    #echo -n (prompt)
    echo -n (prompt_pwd)

    set_color red
    printf "] "
    set_color normal
end
