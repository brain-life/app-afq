function [] = main()

if ~isdeployed()
    switch getenv('ENV')
        case 'IUHPC'
            disp('loading paths for IUHPC')
            addpath(genpath('/N/u/brlife/git/jsonlab'))
            addpath(genpath('/N/soft/rhel7/spm/8'))
            addpath(genpath('/N/u/kitchell/Karst/Applications/vistasoft'))
            addpath(genpath('/N/u/kitchell/Karst/Applications/AFQ'))
        case 'VM'
            disp('loading paths for Jetstream VM')
            %addpath(genpath('/usr/local/jsonlab'))
            %addpath(genpath('/usr/local/spm8'))
            %addpath(genpath('/usr/local/vistasoft'))
            %addpath(genpath('/usr/local/afq-master'))
    end
end

% load my own config.json
config = loadjson('config.json');

% Load the track file
wbfg = dtiImportFibersMrtrix(config.track, .5);

[fg_classified,~,classification]= AFQ_SegmentFiberGroups(fullfile(config.dtiinit, 'dti/dt6.mat'), wbfg, [], [], config.useinterhemisphericsplit);
