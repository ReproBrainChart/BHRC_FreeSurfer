#!/bin/bash
#$ -S /bin/bash
#$ -l h_vmem=8G
#$ -l h_rt=16:00:00
#$ -N fstabulate
#$ -cwd
#$ -tc 100
#$ -t 1-829
#$ -e /cbica/projects/RBC/freesurfer_stats/BHRC/fs-tabulate/analysis/logs
#$ -o /cbica/projects/RBC/freesurfer_stats/BHRC/fs-tabulate/analysis/logs
dssource=ria+file:///cbica/projects/RBC/freesurfer_stats/BHRC/fs-tabulate/input_ria#decf35be-9265-4cee-a75b-232f90f73ca9
pushgitremote=/cbica/projects/RBC/freesurfer_stats/BHRC/fs-tabulate/output_ria/dec/f35be-9265-4cee-a75b-232f90f73ca9
export DSLOCKFILE=/cbica/projects/RBC/freesurfer_stats/BHRC/fs-tabulate/analysis/.SGE_datalad_lock

MAXWAIT=2700
sleeptime=$((RANDOM % MAXWAIT))
echo Sleeping for ${sleeptime}
sleep ${sleeptime}

batch_file_name=subject_ids.txt
subid=$(head -n ${SGE_TASK_ID} ${PWD}/code/${batch_file_name} | tail -n 1)
bash ${PWD}/code/participant_job.sh ${dssource} ${pushgitremote} ${subid}
