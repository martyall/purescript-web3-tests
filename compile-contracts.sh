#!/bin/bash

find ./contracts -name "*.sol" | xargs npx solc --abi -o build

for f in ./build/__contracts_*_sol_*.abi; do 
	mv "$f" "./build/${f##*_}"; 
done

