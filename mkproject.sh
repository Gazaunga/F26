#!/bin/bash

interpreter=$1
script=$2

def create {
mkdir -pv
}

create _Final/_bin
create _Draft/_Tests
create _Templates
create _References
create _lib/_scripts
create _lib/_assets

touch README.md
touch project_outlook.txt

echo "#!/bin/bash "$interpreter"" >> $2
