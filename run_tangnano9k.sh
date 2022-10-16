#!/usr/bin/env bash

PROJECT=blinky

yosys -p "read_verilog $PROJECT.v; synth_gowin -json $PROJECT.json"

nextpnr-gowin --json $PROJECT.json --write pnr.json --device GW1NR-LV9QN88PC6/I5 --family GW1N-9C --cst $PROJECT.cst

gowin_pack -d GW1N-9C -o $PROJECT.fs pnr.json

sudo openFPGALoader -b tangnano9k $PROJECT.fs
