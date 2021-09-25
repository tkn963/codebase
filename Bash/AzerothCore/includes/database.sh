#!/bin/bash
function import_database
{
    install_database_packages

    clear

    echo -e "\e[0;32mImporting database files\e[0m"

    echo "[client]" > $MYSQL_CONFIG
    echo "host=\"$MYSQL_HOSTNAME\"" >> $MYSQL_CONFIG
    echo "port=\"$MYSQL_PORT\"" >> $MYSQL_CONFIG
    echo "user=\"$MYSQL_USERNAME\"" >> $MYSQL_CONFIG
    echo "password=\"$MYSQL_PASSWORD\"" >> $MYSQL_CONFIG

    if [ $1 == 0 ] || [ $1 == 1 ]; then
        if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names -e "SHOW DATABASES LIKE '$MYSQL_DATABASE_AUTH'"` ]; then
            if [ -d $CORE_DIRECTORY/data/sql/base/db_auth ]; then
                for f in $CORE_DIRECTORY/data/sql/base/db_auth/*.sql; do
                    if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names $MYSQL_DATABASE_AUTH -e "SHOW TABLES LIKE '$(basename $f .sql)'"` ]; then
                        echo -e "\e[0;33mSkipping "$(basename $f)"\e[0m"
                        continue;
                    fi

                    echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                    mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_AUTH < $f
                    if [ $? -ne 0 ]; then
                        rm -rf $MYSQL_CONFIG
                        exit $?
                    fi
                done
            fi
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names -e "SHOW DATABASES LIKE '$MYSQL_DATABASE_CHARACTERS'"` ]; then
            if [ -d $CORE_DIRECTORY/data/sql/base/db_characters ]; then
                for f in $CORE_DIRECTORY/data/sql/base/db_characters/*.sql; do
                    if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names $MYSQL_DATABASE_CHARACTERS -e "SHOW TABLES LIKE '$(basename $f .sql)'"` ]; then
                        echo -e "\e[0;33mSkipping "$(basename $f)"\e[0m"
                        continue;
                    fi

                    echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                    mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_CHARACTERS < $f
                    if [ $? -ne 0 ]; then
                        rm -rf $MYSQL_CONFIG
                        exit $?
                    fi
                done
            fi
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names -e "SHOW DATABASES LIKE '$MYSQL_DATABASE_WORLD'"` ]; then
            if [ -d $CORE_DIRECTORY/data/sql/base/db_world ]; then
                for f in $CORE_DIRECTORY/data/sql/base/db_world/*.sql; do
                    if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names $MYSQL_DATABASE_WORLD -e "SHOW TABLES LIKE '$(basename $f .sql)'"` ]; then
                        echo -e "\e[0;33mSkipping "$(basename $f)"\e[0m"
                        continue;
                    fi

                    echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                    mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_WORLD < $f
                    if [ $? -ne 0 ]; then
                        rm -rf $MYSQL_CONFIG
                        exit $?
                    fi
                done
            fi
        fi
    fi

    rm -rf $MYSQL_CONFIG
}

function update_database
{
    install_database_packages

    clear

    echo -e "\e[0;32mImporting database files\e[0m"

    echo "[client]" > $MYSQL_CONFIG
    echo "host=\"$MYSQL_HOSTNAME\"" >> $MYSQL_CONFIG
    echo "port=\"$MYSQL_PORT\"" >> $MYSQL_CONFIG
    echo "user=\"$MYSQL_USERNAME\"" >> $MYSQL_CONFIG
    echo "password=\"$MYSQL_PASSWORD\"" >> $MYSQL_CONFIG

    if [ $1 == 0 ] || [ $1 == 1 ]; then
        if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names -e "SHOW DATABASES LIKE '$MYSQL_DATABASE_AUTH'"` ]; then
            if [ -d $CORE_DIRECTORY/data/sql/updates/db_auth ]; then
                for f in $CORE_DIRECTORY/data/sql/updates/db_auth/*.sql; do
                    echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                    mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_AUTH < $f
                    if [ $? -ne 0 ]; then
                        rm -rf $MYSQL_CONFIG
                        exit $?
                    fi
                done
            fi
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names -e "SHOW DATABASES LIKE '$MYSQL_DATABASE_CHARACTERS'"` ]; then
            if [ -d $CORE_DIRECTORY/data/sql/updates/db_characters ]; then
                for f in $CORE_DIRECTORY/data/sql/updates/db_characters/*.sql; do
                    echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                    mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_CHARACTERS < $f
                    if [ $? -ne 0 ]; then
                        rm -rf $MYSQL_CONFIG
                        exit $?
                    fi
                done
            fi
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [ ! -z `mysql --defaults-extra-file=$MYSQL_CONFIG --skip-column-names -e "SHOW DATABASES LIKE '$MYSQL_DATABASE_WORLD'"` ]; then
            if [ -d $CORE_DIRECTORY/data/sql/updates/db_world ]; then
                for f in $CORE_DIRECTORY/data/sql/updates/db_world/*.sql; do
                    echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                    mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_WORLD < $f
                    if [ $? -ne 0 ]; then
                        rm -rf $MYSQL_CONFIG
                        exit $?
                    fi
                done
            fi
        fi
    fi

    if [ $1 == 0 ] || [ $1 == 2 ]; then
        if [[ -d $ROOT/sql/world ]]; then
            if [[ ! -z "$(ls -A $ROOT/sql/world/)" ]]; then
                for f in $ROOT/sql/world/*; do
                    if [ -d "$f" ]; then
                        if [[ ! -z "$(ls -A $f)" ]]; then
                            for d in $f/*.sql; do
                                echo -e "\e[0;33mImporting "$(basename $d)"\e[0m"
                                mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_WORLD < $d
                                if [ $? -ne 0 ]; then
                                    rm -rf $MYSQL_CONFIG
                                    exit $?
                                fi
                            done
                        fi
                    else
                        echo -e "\e[0;33mImporting "$(basename $f)"\e[0m"
                        mysql --defaults-extra-file=$MYSQL_CONFIG $MYSQL_DATABASE_WORLD < $f
                        if [ $? -ne 0 ]; then
                            rm -rf $MYSQL_CONFIG
                            exit $?
                        fi
                    fi
                done
            fi
        fi
    fi

    rm -rf $MYSQL_CONFIG
}
