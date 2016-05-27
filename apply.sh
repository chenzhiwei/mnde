#!/bin/bash

base=$(cd $(dirname apply.sh) && pwd)

rsync -a "$base"/.[a-z0-9]* --exclude='.git' --exclude='.git[im]*' ~
