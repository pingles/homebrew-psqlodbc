# Postgres' ODBC library

## Install the libraries

    $ brew install unixodbc
    $ brew tap pingles/homebrew
    $ brew install psqlodbc

## Configure ODBC

`/usr/local/etc/odbcinst.ini`
    [PostgreSQL]
    Description     = PostgreSQL
    Driver          = /usr/local/lib/psqlodbcw.so
    Debug           = 0
    CommLog         = 1
    UsageCount      = 1

`/usr/local/etc/odbc.ini`
    [redshiftodbc]
    Driver      = PostgreSQL
    ServerName  = some-cluster.something.eu-west-1.redshift.amazonaws.com
    Port        = 5439
    Database    = data
    Username    = dbuser
    Password    = dbpass
    Debug       = 0
    Autocommit  = 1
