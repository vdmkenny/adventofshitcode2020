#!/bin/bash

echo "Finding Doubles"
parallel --ungroup --bar -n -19 --halt now,success=1 ./calc.sh '{= for my $t (2..$#arg) { if($arg[$t-1] ge $arg[$t]) { skip() } } =}' :::: input :::: input

echo "Finding Triples"
parallel --ungroup --bar -n -19 --halt now,success=1 ./calc.sh '{= for my $t (2..$#arg) { if($arg[$t-1] ge $arg[$t]) { skip() } } =}' :::: input :::: input :::: input

