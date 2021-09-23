#!/bin/bash
INCLUDES=("distribution" "packages" "configuration" "menu" "source" "database")

clear
echo -e "\e[0;32mInitializing...\e[0m"

for i in "${INCLUDES[@]}"; do
    if [ -f "includes/$i.sh" ]; then
        echo -e "\e[0;33mLoading includes/$i.sh\e[0m"
        source "includes/$i.sh"
    else
        echo -e "\e[0;33mUnable to access includes/$i.sh\e[0m"
        exit 1
    fi
done

if [ $# -gt 0 ]; then
    if [ $# -eq 1 ]; then
        if [ $1 == "start" ]; then
            echo "$1"
        elif [ $1 == "stop" ]; then
            echo "$1"
        else
            echo -e "\n\e[0;32mInvalid arguments\e[0m"
            echo -e "\e[0;33mThe supplied arguments are invalid.\e[0m"
        fi
    elif [ $# -eq 2 ]; then
        if [ $1 == "auth" ] || [ $1 == "world" ] || [ $1 == "all" ]; then
            [ $1 == "all" ] && TYPE=0
            [ $1 == "auth" ] && TYPE=1
            [ $1 == "world" ] && TYPE=2

            if [ $2 == "setup" ] || [ $2 == "install" ] || [ $2 == "update" ]; then
                clone_source
                compile_source $TYPE
                fetch_client_data
            elif [ $2 == "database" ] || [ $2 == "db" ]; then
                clear
                if [ $TYPE == 0 ]; then
                    import_database 0
                    update_database 0
                    import_database 1
                    update_database 1
                    import_database 2
                    update_database 2
                elif [ $TYPE == 1 ]; then
                    import_database 0
                    update_database 0
                elif [ $TYPE == 2 ]; then
                    import_database 1
                    update_database 1
                    import_database 2
                    update_database 2
                fi
            elif [ $2 == "cfg" ] || [ $2 == "conf" ] || [ $2 == "config" ] || [ $2 == "configuration" ]; then
                update_configuration $TYPE
                if [ $MODULE_ELUNA_ENABLED ]; then
                    update_configuration 3
                fi
            elif [ $2 == "all" ]; then
                clone_source
                compile_source $TYPE
                fetch_client_data
                if [ $TYPE == 0 ]; then
                    import_database 0
                    update_database 0
                    import_database 1
                    update_database 1
                    import_database 2
                    update_database 2
                elif [ $TYPE == 1]; then
                    import_database 0
                    update_database 0
                elif [ $TYPE == 2 ]; then
                    import_database 1
                    update_database 1
                    import_database 2
                    update_database 2
                fi
                update_configuration $TYPE
                if [ $MODULE_ELUNA_ENABLED ]; then
                    update_configuration 3
                fi
            else
                echo -e "\n\e[0;32mInvalid arguments\e[0m"
                echo -e "\e[0;33mThe supplied arguments are invalid.\e[0m"
            fi
        else
            echo -e "\n\e[0;32mInvalid arguments\e[0m"
            echo -e "\e[0;33mThe supplied arguments are invalid.\e[0m"
        fi
    else
        echo -e "\n\e[0;32mInvalid arguments\e[0m"
        echo -e "\e[0;33mThe supplied arguments are invalid.\e[0m"
    fi
else
    install_menu_packages
    main_menu
fi
