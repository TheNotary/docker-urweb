#!/usr/bin/bash

# Compile the demo web app
urweb -noEmacs -dbms sqlite -db /db.sqlite -demo /Demo demo

# Migrate the database
sqlite3 /db.sqlite <demo/demo.sql

# Boot the web app
./demo/demo.exe
