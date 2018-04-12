#!/bin/bash
module load matlab/2017a

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/soft/rhel7/spm/8'))

%addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/u/kitchell/Karst/Applications/vistasoft'))

addpath(genpath('/N/u/brlife/git/afq'))

mcc -m -R -nodisplay -a /N/u/brlife/git/vistasoft/mrDiffusion/templates -d compiled main
exit
END
matlab -nodisplay -nosplash -r build && rm build.m
