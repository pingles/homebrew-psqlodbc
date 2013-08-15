# Postgres' ODBC library

## Install the libraries

    $ brew tap pingles/homebrew-psqlodbc
    $ brew install libiodbc
    $ brew install psqlodbc --with-iodbc

## Configure ODBC

Although I've been able to connect to Redshift with [unixodbc](http://www.unixodbc.org) using the psqlodbc driver from R, I wasn't able to from Julia. I've been able to connect successfully with [iODBC](http://www.iodbc.org/).

iODBC doesn't seem to like using configured DSNs. I've had success connecting from [R](http://www.r-project.org),  [Julia](http://www.julialang.org), and Python using ODBC.

In all situations I've had to connect using [ODBC's SQLDriverConnect](http://msdn.microsoft.com/en-us/library/windows/desktop/ms715433(v=vs.85).aspx) routine.

```julia
Pkg.add("ODBC")
using ODBC

ODBC.advancedconnect("Driver=/usr/local/lib/psqlodbcw.so;Database=data;Username=user;Password=pass;Server=foo.redshift.amazonaws.com;Port=5439;")
ODBC.query("SELECT * FROM information_schema.tables")
```

```r
install.packages("RODBC")
c <- odbcDriverConnect("Driver=/usr/local/lib/psqlodbcw.so;Database=data;Username=user;Password=pass;Server=foo.redshift.amazonaws.com;Port=5439;")
results <- sqlQuery(c, "SELECT * FROM information_schema.tables")
```
