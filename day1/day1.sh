#!/bin/bash

echo "Finding Doubles"
time parallel -j 128 -a input -a input ./calc.sh

echo "Finding Triples"
time parallel -j 128 -a input -a input -a input ./calc.sh
