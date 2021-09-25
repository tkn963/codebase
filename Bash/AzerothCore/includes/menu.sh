#!/bin/bash
function main_menu
{
    SELECTION=$(whiptail --title "AzerothCore" --menu "Choose an option" 11 50 0 \
    1 "Manage the source code" \
    2 "Manage the databases" \
    3 "Manage the configuration files" \
    4 "Manage the compiled binaries" \
    3>&1 1>&2 2>&3)

    if [[ $SELECTION ]]; then
        if [[ $SELECTION == 1 ]]; then
            source_menu
        elif [[ $SELECTION == 2 ]]; then
            database_menu
        elif [[ $SELECTION == 3 ]]; then
            main_menu 1
        elif [[ $SELECTION == 4 ]]; then
            main_menu
        fi
    fi
}

function source_menu
{
    SELECTION=$(whiptail --title "Manage the source code" --menu "Choose an option" 11 50 0 \
    1 "Download or update the source code" \
    2 "Compile the source into binaries" \
    3 "Download or update the client data files" \
    3>&1 1>&2 2>&3)

    if [[ $SELECTION ]]; then
        if [[ $SELECTION == 1 ]]; then
            SELECTION=$(whiptail --title "Available Modules" --checklist \
            "Select the modules to use" 11 50 4 \
            "Eluna" "Allows scripts written in LUA" ${MODULE_ELUNA_ENABLED/true/ON} \
            3>&1 1>&2 2>&3)

            if [[ $SELECTION ]]; then
                if [[ $SELECTION == *"Eluna"* ]]; then
                    MODULE_ELUNA_ENABLED="true"
                else
                    MODULE_ELUNA_ENABLED="false"
                fi

                generate_settings
            else
                source_menu
                exit 0
            fi

            clone_source
            source_menu
        elif [[ $SELECTION == 2 ]]; then
            [ -f $CORE_DIRECTORY/bin/auth.sh ] && AUTH=1 || AUTH=0
            [ -f $CORE_DIRECTORY/bin/world.sh ] && WORLD=1 || WORLD=0
            [ ! -f $CORE_DIRECTORY/bin/start.sh ] && AUTH=1 WORLD=1

            SELECTION=$(whiptail --title "Compile the source into binaries" --checklist \
            "Select the parts to use for this compilation" 11 50 4 \
            "Auth" "Enable the use of authserver" $AUTH \
            "World" "Enable the use of worldserver" $WORLD \
            3>&1 1>&2 2>&3)

            if [[ $SELECTION ]]; then
                if [[ $SELECTION == *"Auth"* ]] && [[ $SELECTION == *"World"* ]]; then
                    compile_source 0
                elif [[ $SELECTION == *"Auth"* ]]; then
                    compile_source 1
                elif [[ $SELECTION == *"World"* ]]; then
                    compile_source 2
                fi

                source_menu
            fi
        elif [[ $SELECTION == 3 ]]; then
            fetch_client_data
            source_menu
        fi
    else
        main_menu
    fi
}

function database_menu
{
    if [[ $1 == 1 ]]; then
        if (whiptail --title "Manage the databases" --yesno "Do you wish to customize the database credentials before proceeding?" 7 72); then
            MYSQL_HOSTNAME=$(whiptail --inputbox "The IP or hostname of the MySQL/MariaDB server" 8 60 $MYSQL_HOSTNAME --title "Manage the databases" 3>&1 1>&2 2>&3)
            MYSQL_PORT=$(whiptail --inputbox "The port number of the MySQL/MariaDB server" 8 60 $MYSQL_PORT --title "Manage the databases" 3>&1 1>&2 2>&3)
            MYSQL_USERNAME=$(whiptail --inputbox "The username used to connect to the MySQL/MariaDB server" 8 60 $MYSQL_USERNAME --title "Manage the databases" 3>&1 1>&2 2>&3)
            MYSQL_PASSWORD=$(whiptail --passwordbox "The password used to connect to the MySQL/MariaDB server" 8 60 $MYSQL_PASSWORD --title "Manage the databases" 3>&1 1>&2 2>&3)
            MYSQL_DATABASE_AUTH=$(whiptail --inputbox "The name of the auth database" 8 60 $MYSQL_DATABASE_AUTH --title "Manage the databases" 3>&1 1>&2 2>&3)
            MYSQL_DATABASE_CHARACTERS=$(whiptail --inputbox "The name of the characters database" 8 60 $MYSQL_DATABASE_CHARACTERS --title "Manage the databases" 3>&1 1>&2 2>&3)
            MYSQL_DATABASE_WORLD=$(whiptail --inputbox "The name of the world database" 8 60 $MYSQL_DATABASE_WORLD --title "Manage the databases" 3>&1 1>&2 2>&3)

            if [[ ! -z $MYSQL_HOSTNAME ]] && [[ ! -z $MYSQL_PORT ]] && [[ ! -z $MYSQL_USERNAME ]] && [[ ! -z $MYSQL_PASSWORD ]] && [[ ! -z $MYSQL_DATABASE_AUTH ]] && [[ ! -z $MYSQL_DATABASE_CHARACTERS ]] && [[ ! -z $MYSQL_DATABASE_WORLD ]]; then
                generate_settings
            else
                whiptail --title "An error has occured" --msgbox "At least one of the entered values is invalid or empty" 7 58
                main_menu
            fi
        fi
    fi

    SELECTION=$(whiptail --title "Manage the databases" --menu "Choose an option" 11 50 0 \
    1 "Manage the database $MYSQL_DATABASE_AUTH" \
    2 "Manage the database $MYSQL_DATABASE_CHARACTERS" \
    3 "Manage the database $MYSQL_DATABASE_WORLD" \
    3>&1 1>&2 2>&3)

    if [[ $SELECTION ]]; then
        TYPE=$SELECTION

        if [[ $SELECTION == 3 ]]; then
            if [[ -d $ROOT/sql/world && ! -z "$(ls -A $ROOT/sql/world/)" ]]; then
                SELECTION=$(whiptail --title "$DATABASE" --menu "Choose an option" 11 50 0 \
                1 "Import all the required tables" \
                2 "Import all the available updates" \
                3 "Import any available custom content" \
                4 "Update the realmlist" \
                3>&1 1>&2 2>&3)
            else
                SELECTION=$(whiptail --title "$DATABASE" --menu "Choose an option" 11 50 0 \
                1 "Import all the required tables" \
                2 "Import all the available updates" \
                4 "Update the realmlist" \
                3>&1 1>&2 2>&3)
            fi
        else
            SELECTION=$(whiptail --title "$DATABASE" --menu "Choose an option" 11 50 0 \
            1 "Import all the required tables" \
            2 "Import all the available updates" \
            3>&1 1>&2 2>&3)
        fi

        if [[ $SELECTION ]]; then
            if [[ $SELECTION == 1 ]]; then
                import_database $TYPE $SELECTION
            elif [[ $SELECTION == 2 ]] || [[ $SELECTION == 3 ]] || [[ $SELECTION == 4 ]]; then
                update_database $TYPE $SELECTION
            fi

            database_menu
        fi
    else
        main_menu
    fi
}
