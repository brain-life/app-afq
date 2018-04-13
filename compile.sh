#!/bin/bash
module load matlab/2017a

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/soft/rhel7/spm/8'))

%my local branch has https://github.com/vistalab/vistasoft/pull/287
addpath(genpath('/N/u/hayashis/git/vistasoft'))

%https://github.com/yeatmanlab/AFQ/issues/24
%addpath(genpath('/N/u/brlife/git/afq'))
addpath(genpath('/N/u/kitchell/Karst/Applications/AFQ'))

%mcc -m -R -nodisplay -a /N/u/brlife/git/vistasoft/mrDiffusion/templates -d compiled main
mcc -m -R -nodisplay -d compiled main
exit
END
matlab -nodisplay -nosplash -r build && rm build.m
