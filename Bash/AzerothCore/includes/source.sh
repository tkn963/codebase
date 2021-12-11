#!/bin/bash
function clone_source
{
    install_clone_packages

    clear

    printf "${COLOR_GREEN}Downloading the source code${COLOR_END}\n"

    if [ ! -d $CORE_DIRECTORY ]; then
        git clone --recursive --branch master https://github.com/azerothcore/azerothcore-wotlk.git $CORE_DIRECTORY
        if [ $? -ne 0 ]; then
            exit $?
        fi
    else
        if [[ $CORE_PULL_REQUEST == 0 ]]; then
            cd $CORE_DIRECTORY

            if [ $(git branch --show-current) != "master" ]; then
                rm -rf $CORE_DIRECTORY/build

                git switch -C master origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi

            git fetch --all
            if [ $? -ne 0 ]; then
                exit $?
            fi

            git reset --hard origin/master
            if [ $? -ne 0 ]; then
                exit $?
            fi

            git submodule update
            if [ $? -ne 0 ]; then
                exit $?
            fi
        fi
    fi

    if [[ $CORE_PULL_REQUEST > 0 ]]; then
        cd $CORE_DIRECTORY

        if [ $(git branch --show-current) != "pr-$CORE_PULL_REQUEST" ]; then
            rm -rf $CORE_DIRECTORY/build

            git checkout -b pr-$CORE_PULL_REQUEST
            if [ $? -ne 0 ]; then
                exit $?
            fi
        fi

        git pull origin pull/$CORE_PULL_REQUEST/head
        if [ $? -ne 0 ]; then
            exit $?
        fi

        git reset --hard pr-$CORE_PULL_REQUEST
        if [ $? -ne 0 ]; then
            exit $?
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [[ $MODULE_AHBOT_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-ah-bot ]; then
                git clone --branch master https://github.com/azerothcore/mod-ah-bot.git $CORE_DIRECTORY/modules/mod-ah-bot
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-ah-bot

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-ah-bot ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-ah-bot

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_ACTIVATE_ZONES_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-activatezones ]; then
                git clone --branch master https://github.com/tkn963/mod-activatezones.git $CORE_DIRECTORY/modules/mod-activatezones
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-activatezones

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [[ -d $CORE_DIRECTORY/modules/mod-activatezones ]]; then
                rm -rf $CORE_DIRECTORY/modules/mod-activatezones

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_ASSISTANT_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-assistant ]; then
                git clone --branch master https://github.com/tkn963/mod-assistant.git $CORE_DIRECTORY/modules/mod-assistant
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-assistant

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-assistant ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-assistant

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_ELUNA_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-eluna-lua-engine ]; then
                git clone --recursive --branch master https://github.com/azerothcore/mod-eluna-lua-engine.git $CORE_DIRECTORY/modules/mod-eluna-lua-engine
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-eluna-lua-engine

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-eluna-lua-engine ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-eluna-lua-engine

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_GROUP_QUESTS_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-groupquests ]; then
                git clone --recursive --branch master https://github.com/tkn963/mod-groupquests.git $CORE_DIRECTORY/modules/mod-groupquests
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-groupquests

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-groupquests ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-groupquests

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_LEARN_SPELLS_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-learnspells ]; then
                git clone --branch master https://github.com/tkn963/mod-learnspells.git $CORE_DIRECTORY/modules/mod-learnspells
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-learnspells

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-learnspells ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-learnspells

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_LEVEL_REWARD_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-levelreward ]; then
                git clone --branch master https://github.com/tkn963/mod-levelreward.git $CORE_DIRECTORY/modules/mod-levelreward
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-levelreward

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-levelreward ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-levelreward

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_RECRUIT_A_FRIEND_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-recruitafriend ]; then
                git clone --branch master https://github.com/tkn963/mod-recruitafriend.git $CORE_DIRECTORY/modules/mod-recruitafriend
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-recruitafriend

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-recruitafriend ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-recruitafriend

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_SKIP_DK_STARTING_AREA_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-skip-dk-starting-area ]; then
                git clone --recursive --branch master https://github.com/azerothcore/mod-skip-dk-starting-area.git $CORE_DIRECTORY/modules/mod-skip-dk-starting-area
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-skip-dk-starting-area

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-skip-dk-starting-area ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-skip-dk-starting-area

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_SPAWN_POINTS_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-spawnpoints ]; then
                git clone --branch master https://github.com/tkn963/mod-spawnpoints.git $CORE_DIRECTORY/modules/mod-spawnpoints
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-spawnpoints

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-spawnpoints ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-spawnpoints

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi

        if [[ $MODULE_WEEKEND_BONUS_ENABLED == "true" ]]; then
            if [ ! -d $CORE_DIRECTORY/modules/mod-weekendbonus ]; then
                git clone --branch master https://github.com/tkn963/mod-weekendbonus.git $CORE_DIRECTORY/modules/mod-weekendbonus
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            else
                cd $CORE_DIRECTORY/modules/mod-weekendbonus

                git fetch --all
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git reset --hard origin/master
                if [ $? -ne 0 ]; then
                    exit $?
                fi

                git submodule update
                if [ $? -ne 0 ]; then
                    exit $?
                fi
            fi
        else
            if [ -d $CORE_DIRECTORY/modules/mod-weekendbonus ]; then
                rm -rf $CORE_DIRECTORY/modules/mod-weekendbonus

                if [ -d $CORE_DIRECTORY/build ]; then
                    rm -rf $CORE_DIRECTORY/build
                fi
            fi
        fi
    fi
}

function compile_source
{
    install_compile_packages

    stop_process

    clear

    printf "${COLOR_GREEN}Compiling the source code${COLOR_END}\n"

    mkdir -p $CORE_DIRECTORY/build && cd $_
    cmake ../ -DCMAKE_INSTALL_PREFIX=$CORE_DIRECTORY -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DWITH_WARNINGS=0 -DTOOLS=0 -DSCRIPTS=static
    if [ $? -ne 0 ]; then
        exit $?
    fi

    make -j $(nproc)
    if [ $? -ne 0 ]; then
        exit $?
    fi

    make install
    if [ $? -ne 0 ]; then
        exit $?
    fi

    echo "#!/bin/bash" > $CORE_DIRECTORY/bin/start.sh
    echo "#!/bin/bash" > $CORE_DIRECTORY/bin/stop.sh

    if [ $1 == 0 ] || [ $1 == 1 ]; then
        echo "screen -AmdS auth ./auth.sh" >> $CORE_DIRECTORY/bin/start.sh
        echo "screen -X -S \"auth\" quit" >> $CORE_DIRECTORY/bin/stop.sh

        echo "#!/bin/sh" > $CORE_DIRECTORY/bin/auth.sh
        echo "while :; do" >> $CORE_DIRECTORY/bin/auth.sh
        echo "./authserver" >> $CORE_DIRECTORY/bin/auth.sh
        echo "sleep 20" >> $CORE_DIRECTORY/bin/auth.sh
        echo "done" >> $CORE_DIRECTORY/bin/auth.sh

        chmod +x $CORE_DIRECTORY/bin/auth.sh
    else
        if [ -f $CORE_DIRECTORY/bin/auth.sh ]; then
            rm -rf $CORE_DIRECTORY/bin/auth.sh
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        echo "screen -AmdS world ./world.sh" >> $CORE_DIRECTORY/bin/start.sh
        echo "screen -X -S \"world\" quit" >> $CORE_DIRECTORY/bin/stop.sh

        echo "#!/bin/sh" > $CORE_DIRECTORY/bin/world.sh
        echo "while :; do" >> $CORE_DIRECTORY/bin/world.sh
        echo "./worldserver" >> $CORE_DIRECTORY/bin/world.sh
        echo "sleep 20" >> $CORE_DIRECTORY/bin/world.sh
        echo "done" >> $CORE_DIRECTORY/bin/world.sh

        chmod +x $CORE_DIRECTORY/bin/world.sh
    else
        if [ -f $CORE_DIRECTORY/bin/world.sh ]; then
            rm -rf $CORE_DIRECTORY/bin/world.sh
        fi
    fi

    chmod +x $CORE_DIRECTORY/bin/start.sh
    chmod +x $CORE_DIRECTORY/bin/stop.sh
}

function fetch_client_data
{
    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [ ! -d $CORE_DIRECTORY/bin/Cameras ] || [ ! -d $CORE_DIRECTORY/bin/dbc ] || [ ! -d $CORE_DIRECTORY/bin/maps ] || [ ! -d $CORE_DIRECTORY/bin/mmaps ] || [ ! -d $CORE_DIRECTORY/bin/vmaps ]; then
            CORE_INSTALLED_CLIENT_DATA=0
        fi

        clear
        printf "${COLOR_GREEN}Downloading client data files${COLOR_END}\n"

        if [ $CORE_INSTALLED_CLIENT_DATA != $CORE_REQUIRED_CLIENT_DATA ]; then
            if [ -d $CORE_DIRECTORY/bin/Cameras ] || [ -d $CORE_DIRECTORY/bin/dbc ] || [ -d $CORE_DIRECTORY/bin/maps ] || [ -d $CORE_DIRECTORY/bin/mmaps ] || [ -d $CORE_DIRECTORY/bin/vmaps ]; then
                rm -rf $CORE_DIRECTORY/bin/Cameras $CORE_DIRECTORY/bin/dbc $CORE_DIRECTORY/bin/maps $CORE_DIRECTORY/bin/mmaps $CORE_DIRECTORY/bin/vmaps
            fi

            curl -L https://github.com/wowgaming/client-data/releases/download/v${CORE_REQUIRED_CLIENT_DATA}/data.zip > $CORE_DIRECTORY/bin/data.zip
            if [ $? -ne 0 ]; then
                exit $?
            fi

            unzip -o "$CORE_DIRECTORY/bin/data.zip" -d "$CORE_DIRECTORY/bin/"
            if [ $? -ne 0 ]; then
                exit $?
            fi

            rm -rf $CORE_DIRECTORY/bin/data.zip
            if [ $? -ne 0 ]; then
                exit $?
            fi

            CORE_INSTALLED_CLIENT_DATA=$CORE_REQUIRED_CLIENT_DATA
            export_settings
        else
            printf "${COLOR_ORANGE}The required client data files are already installed${COLOR_END}\n"
        fi
    fi
}

function update_client_data
{
    install_clone_packages

    clear

    printf "${COLOR_GREEN}Updating client data version${COLOR_END}\n"

    CORE_AVAILABLE_CLIENT_DATA=$(git ls-remote --tags --sort="v:refname" https://github.com/wowgaming/client-data.git | tail -n1 | cut --delimiter='/' --fields=3 | sed 's/v//')
    if [ $? -ne 0 ]; then
        exit $?
    fi

    if [[ $CORE_REQUIRED_CLIENT_DATA != $CORE_AVAILABLE_CLIENT_DATA ]]; then
        printf "${COLOR_ORANGE}A new version is available, updating required client data to ${CORE_AVAILABLE_CLIENT_DATA}${COLOR_END}\n"
        CORE_REQUIRED_CLIENT_DATA=$CORE_AVAILABLE_CLIENT_DATA
        export_settings
    else
        printf "${COLOR_ORANGE}There's no new version available${COLOR_END}\n"
    fi
}
