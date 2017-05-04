#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -nfs ${PWD}/${f} ${HOME}/${f}
done
