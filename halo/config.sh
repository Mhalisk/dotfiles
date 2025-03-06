# [`halo-devs`](https://mhalisk-halo.gitlab.com/halo-devs)
if [ "$OS" = "windows" ]; then
    set halo_home="/Users/mhalisk/Dev/gitlab.com/halo"
    call %halo_home%\dx\scripts\aliases.bat
else
    export halo_home="/Users/mhalisk/Dev/gitlab.com/halo"
    source "$halo_home/dx/scripts/aliases.sh"
fi
