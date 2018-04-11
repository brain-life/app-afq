function [] = main()

if ~isdeployed()
    switch getenv('ENV')
        case 'IUHPC'
            disp('loading paths for IUHPC')
            addpath(genpath('/N/u/brlife/git/jsonlab'))
            addpath(genpath('/N/soft/rhel7/spm/8'))
            %addpath(genpath('/N/u/kitchell/Karst/Applications/vistasoft'))
            %addpath(genpath('/N/u/kitchell/Karst/Applications/AFQ'))
            addpath(genpath('/N/u/brlife/git/vistasoft'))
            addpath(genpath('/N/u/brlife/git/afq'))
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

sub_dirs = { [config.dtiinit '/dti'] };
sub_group = [1]; %0 = control 1 = patient
afq = AFQ_Create('run_mode', 'test', 'sub_dirs', sub_dirs, 'sub_group', sub_group, 'showfigs', 0);
[afq patient_data control_data norms abn abnTracts] = AFQ_run(sub_dirs, sub_group, afq);

save('output.mat', 'afq');
disp('done');

%[fg_classified,~,classification]= AFQ_SegmentFiberGroups(fullfile(config.dtiinit, 'dti/dt6.mat'), wbfg, [], [], config.useinterhemisphericsplit);
