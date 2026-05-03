status is-interactive; or return

set --query __auto_ls_last_pwd
or set --global __auto_ls_last_pwd ""

function __auto_ls_on_prompt --on-event fish_prompt
    if test "$PWD" = "$__auto_ls_last_pwd"
        return
    end

    set --global __auto_ls_last_pwd "$PWD"
    ls
end
