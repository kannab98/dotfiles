#!/bin/bash
file=~/.dotfiles/kitty/kitty.json
current_window=$(xdotool getactivewindow)
kitty @ ls > $file
N=$(cat $file | jq length) # количество системных окон
for ((n=0;n<$N;n++)); do
    win=$(cat $file | jq ".[$n].tabs[0].windows[0].env.WINDOWID")
    win=${win#\"}
    win=${win%\"}
    if [ "$win" = "$current_window" ]; then
        window='cat $file|  jq ".[$n].tabs[$k].windows[$l]"'
        cmd=$(eval $window.foreground_processes[0].cmdline[0])
        cwd=$(eval $window.foreground_processes[0].cwd)
        cwd=${cwd#\"}
        cwd=${cwd%\"}
        echo $cwd
    fi
done
#echo N=$N
#current_cwd(){
    #for ((n=0;n<$N;n++)); do 
        ##M=$(echo  $(cat $file | jq ".[$n].tabs") | jq length) # количество табов


        ##for ((m=0;m<$M;m++)); do
            ##K=$(echo $(cat $file | jq ".[$n].tabs[$m]") | jq length)


            ###for ((k=0;k<$K;k++)); do
                ###L=$(echo $(cat $file | jq ".[$n].tabs[$k].windows") | jq length)

                ####for ((l=0;l<$L;l++)); do
                        ####window='cat $file|  jq ".[$n].tabs[$k].windows[$l]"'
                    #####I=$(echo $(cat $file|  jq ".[$n].tabs[$k].windows[$l].foreground_processes") | jq length) # количество процессов в фоне
                        ####if [ "$(eval $window.is_focused)"  = "true" ]; then
                            ####cwd=$(eval $window.foreground_processes[0].cwd)
                            ####cwd=${cwd#\"}
                            ####cwd=${cwd%\"}
                            ####echo $cwd
                        ####fi

                    #####for ((i=0;i<$I;i++)); do 

                        #####if [ "$(eval $window.is_focused)"  = "true" ]; then
                            #####echo $(eval $window.foreground_processes[$i])
                        #####fi
                    #####done
                ####done
            ###done
        ##done
    #done

#}

