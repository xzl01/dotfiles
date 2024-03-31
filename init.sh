#!/bin/bash

cd scripts/

./create_cache.sh
./sources_extacter.sh

cd ..
./config.sh install

cd scripts/
./default_setting.sh
