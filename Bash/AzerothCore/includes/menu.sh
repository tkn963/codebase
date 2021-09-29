#!/bin/bash
[[ -f $CORE_DIRECTORY/bin/auth.sh && -f $CORE_DIRECTORY/bin/authserver ]] && ENABLE_AUTHSERVER=1 || ENABLE_AUTHSERVER=0
[[ -f $CORE_DIRECTORY/bin/world.sh && -f $CORE_DIRECTORY/bin/worldserver ]] && ENABLE_WORLDSERVER=1 || ENABLE_WORLDSERVER=0
[ ! -f $CORE_DIRECTORY/bin/start.sh ] && ENABLE_AUTHSERVER=1 ENABLE_WORLDSERVER=1

function show_menu
{
    clear

    if [[ -z $1 && -z $2 ]]; then
        printf "${COLOR_PURPLE}AzerothCore${COLOR_END}\n"
        printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Manage the source code${COLOR_END}\n"
        printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Manage the databases${COLOR_END}\n"
        printf "${COLOR_CYAN}3) ${COLOR_ORANGE}Manage the configuration options${COLOR_END}\n"
        if [[ -f $CORE_DIRECTORY/bin/authserver && -f $CORE_DIRECTORY/bin/worldserver ]] && [[ -f $CORE_DIRECTORY/bin/auth.sh || -f $CORE_DIRECTORY/bin/world.sh ]]; then
            if [ $(dpkg-query -W -f='${Status}' screen 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
                if [[ -z `screen -list | grep -E "auth"` ]] && [[ -z `screen -list | grep -E "world"` ]]; then
                    printf "${COLOR_CYAN}4) ${COLOR_ORANGE}Start the compiled binaries${COLOR_END}\n"
                else
                    printf "${COLOR_CYAN}4) ${COLOR_ORANGE}Stop all running processes${COLOR_END}\n"
                fi
            fi
        fi
        printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Exit${COLOR_END}\n"
        printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
        read -s -n 1 s

        case $s in
            [1-3]) show_menu $s;;
            4) if [[ -z `screen -list | grep -E "auth"` ]] && [[ -z `screen -list | grep -E "world"` ]]; then start_process; sleep 1; else stop_process; fi; show_menu;;
            0) print_quote;;
            *) show_menu;;
        esac
    elif [[ $1 == 1 ]]; then
        if [[ -z $2 ]]; then
            printf "${COLOR_PURPLE}Manage the source code${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Manage the available modules${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Download the latest version of the repository${COLOR_END}\n"
            printf "${COLOR_CYAN}3) ${COLOR_ORANGE}Compile the source code into binaries${COLOR_END}\n"
            if [[ -f $CORE_DIRECTORY/bin/authserver && -f $CORE_DIRECTORY/bin/worldserver ]] && [[ -f $CORE_DIRECTORY/bin/world.sh ]]; then
                printf "${COLOR_CYAN}4) ${COLOR_ORANGE}Download the client data files${COLOR_END}\n"
            fi
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                1) show_menu $1 $s;;
                2) stop_process; clone_source; show_menu $1;;
                [3-4]) show_menu $1 $s;;
                0) show_menu;;
                *) show_menu $1;;
            esac
        elif [[ $2 == 1 ]]; then
            printf "${COLOR_PURPLE}Manage the available modules${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Auction House Bot: ${COLOR_END}"
            [ $MODULE_AHBOT_ENABLED == "true" ] && printf "${COLOR_GREEN}Enabled${COLOR_END}\n" || printf "${COLOR_RED}Disabled${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Eluna LUA Engine: ${COLOR_END}"
            [ $MODULE_ELUNA_ENABLED == "true" ] && printf "${COLOR_GREEN}Enabled${COLOR_END}\n" || printf "${COLOR_RED}Disabled${COLOR_END}\n"
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                1) if [ $MODULE_AHBOT_ENABLED == "true" ]; then MODULE_AHBOT_ENABLED="false"; else MODULE_AHBOT_ENABLED="true"; fi; export_settings; show_menu $1 $2;;
                2) if [ $MODULE_ELUNA_ENABLED == "true" ]; then MODULE_ELUNA_ENABLED="false"; else MODULE_ELUNA_ENABLED="true"; fi; export_settings; show_menu $1 $2;;
                0) show_menu $1;;
                *) show_menu $1 $2;;
            esac
        elif [[ $2 == 3 ]]; then
            if [ -d $CORE_DIRECTORY ]; then
                printf "${COLOR_PURPLE}Compile the source code into binaries${COLOR_END}\n"
                printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Authserver: ${COLOR_END}"
                [ $ENABLE_AUTHSERVER == 1 ] && printf "${COLOR_GREEN}Enabled${COLOR_END}\n" || printf "${COLOR_RED}Disabled${COLOR_END}\n"
                printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Worldserver: ${COLOR_END}"
                [ $ENABLE_WORLDSERVER == 1 ] && printf "${COLOR_GREEN}Enabled${COLOR_END}\n" || printf "${COLOR_RED}Disabled${COLOR_END}\n"
                printf "${COLOR_CYAN}3) ${COLOR_ORANGE}Compile with these settings${COLOR_END}\n"
                printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
                printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
                read -s -n 1 s

                case $s in
                    1) [ $ENABLE_AUTHSERVER == 0 ] && ENABLE_AUTHSERVER=1 || ENABLE_AUTHSERVER=0; show_menu $1 $2;;
                    2) [ $ENABLE_WORLDSERVER == 0 ] && ENABLE_WORLDSERVER=1 || ENABLE_WORLDSERVER=0; show_menu $1 $2;;
                    3) if [[ $ENABLE_AUTHSERVER == 1 && $ENABLE_WORLDSERVER == 1 ]]; then compile_source 0; elif [[ $ENABLE_AUTHSERVER == 1 && $ENABLE_WORLDSERVER == 0 ]]; then compile_source 1; elif [[ $ENABLE_AUTHSERVER == 0 && $ENABLE_WORLDSERVER == 1 ]]; then compile_source 2; fi; show_menu $1 $2;;
                    0) show_menu $1;;
                    *) show_menu $1 $2;;
                esac
            else
                printf "${COLOR_PURPLE}Compile the source code into binaries${COLOR_END}\n"
                printf "${COLOR_ORANGE}The source code is not accessible${COLOR_END}\n"
                printf "${COLOR_ORANGE}Make sure to download the source code first${COLOR_END}\n"
                printf "\n${COLOR_GREEN}Press any key to continue...${COLOR_END}"
                read -s -n 1
                show_menu $1
            fi
        elif [[ $2 == 4 ]]; then
            printf "${COLOR_PURPLE}Download the client data files${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Check for a new version${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Download the required files${COLOR_END}\n"
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                1) update_client_data; sleep 1; show_menu $1 $2;;
                2) fetch_client_data; sleep 1; show_menu $1 $2;;
                0) show_menu $1;;
                *) show_menu $1 $2;;
            esac
        fi
    elif [[ $1 == 2 ]]; then
        if [[ -z $2 ]]; then
            printf "${COLOR_PURPLE}Manage the databases${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Manage the auth database${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Manage the characters database${COLOR_END}\n"
            printf "${COLOR_CYAN}3) ${COLOR_ORANGE}Manage the world database${COLOR_END}\n"
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                [1-3]) show_menu $1 $s;;
                0) show_menu;;
                *) show_menu $1;;
            esac
        else
            [ $2 == 1 ] && DB="auth"
            [ $2 == 2 ] && DB="characters"
            [ $2 == 3 ] && DB="world"

            printf "${COLOR_PURPLE}Manage the ${DB} database${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Import all tables and data${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Import all available updates${COLOR_END}\n"
            if [ $2 == 3 ]; then
                printf "${COLOR_CYAN}3) ${COLOR_ORANGE}Import any custom content${COLOR_END}\n"
            fi
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                [1-3]) import_database $2 $s; show_menu $1 $2;;
                0) show_menu $1;;
                *) show_menu $1 $2;;
            esac
        fi
    elif [[ $1 == 3 ]]; then
        if [[ -z $2 ]]; then
            printf "${COLOR_PURPLE}Manage the configuration options${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Manage the database options${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Manage the server options${COLOR_END}\n"
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                [1-2]) show_menu $1 $s;;
                0) show_menu;;
                *) show_menu $1;;
            esac
        elif [ $2 == 1 ]; then
            printf "${COLOR_PURPLE}Manage the database options${COLOR_END}\n"
            printf "${COLOR_CYAN}1) ${COLOR_ORANGE}Hostname: ${MYSQL_HOSTNAME}${COLOR_END}\n"
            printf "${COLOR_CYAN}2) ${COLOR_ORANGE}Port: ${MYSQL_PORT}${COLOR_END}\n"
            printf "${COLOR_CYAN}3) ${COLOR_ORANGE}Username: ${MYSQL_USERNAME}${COLOR_END}\n"
            printf "${COLOR_CYAN}4) ${COLOR_ORANGE}Password: ${MYSQL_PASSWORD//?/*}${COLOR_END}\n"
            printf "${COLOR_CYAN}5) ${COLOR_ORANGE}Auth database: ${MYSQL_DATABASE_AUTH}${COLOR_END}\n"
            printf "${COLOR_CYAN}6) ${COLOR_ORANGE}Characters database: ${MYSQL_DATABASE_CHARACTERS}${COLOR_END}\n"
            printf "${COLOR_CYAN}7) ${COLOR_ORANGE}World database: ${MYSQL_DATABASE_WORLD}${COLOR_END}\n"
            printf "${COLOR_CYAN}0) ${COLOR_ORANGE}Return to the previous menu${COLOR_END}\n"
            printf "${COLOR_GREEN}Choose an option:${COLOR_END}"
            read -s -n 1 s

            case $s in
                1) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_HOSTNAME}" i; if [ ! -z $i ]; then MYSQL_HOSTNAME=$i; fi; export_settings; show_menu $1 $2;;
                2) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_PORT}" i; if [ ! -z $i ]; then MYSQL_PORT=$i; fi; export_settings; show_menu $1 $2;;
                3) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_USERNAME}" i; if [ ! -z $i ]; then MYSQL_USERNAME=$i; fi; export_settings; show_menu $1 $2;;
                4) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_PASSWORD}" i; if [ ! -z $i ]; then MYSQL_PASSWORD=$i; fi; export_settings; show_menu $1 $2;;
                5) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_DATABASE_AUTH}" i; if [ ! -z $i ]; then MYSQL_DATABASE_AUTH=$i; fi; export_settings; show_menu $1 $2;;
                6) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_DATABASE_CHARACTERS}" i; if [ ! -z $i ]; then MYSQL_DATABASE_CHARACTERS=$i; fi; export_settings; show_menu $1 $2;;
                7) printf "\r${COLOR_GREEN}Enter the new value:${COLOR_END} "; read -e -i "${MYSQL_DATABASE_WORLD}" i; if [ ! -z $i ]; then MYSQL_DATABASE_WORLD=$i; fi; export_settings; show_menu $1 $2;;
                0) show_menu $1;;
                *) show_menu $1 $2;;
            esac
        elif [ $2 == 2 ]; then
            printf "${COLOR_ORANGE}Manage the server options${COLOR_END}\n"
        fi
    fi
}
