#!/bin/bash

cd scripts/

./create_cache.sh
./sources_extacter.sh

cd ..
./stow.sh

cd scripts/
./default_setting.sh
