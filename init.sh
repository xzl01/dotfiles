#!/bin/bash

./stow.sh

cd scripts/

./create_cache.sh
./themepatcher.sh BibataIce ../
./themepatcher.sh TelaBlue ../
./themepatcher.sh Catppuccin-Mocha ../
