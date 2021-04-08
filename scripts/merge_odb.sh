#!/bin/bash

# When you restart an analysis, Abaqus creates a new output database file
# (job-name.odb) and writes output data to that file. The 'restartjoin' utility
# can merge the two .odb files.
# This script automates that procedure. You need to give the names of the
# original .odb file and the one that corresponds to the restarted analysis.
# The output is the merged .odb file, starting with "Restart_".
#
# Reference:
# https://abaqus-docs.mit.edu/2017/English/SIMACAEEXCRefMap/simaexc-c-restartjoinproc.htm


# Edit if necessary
ORIG_ODB="Job-1.odb"
RESTART_ODB="Job-1_restart.odb"

# Do not edit, Abaqus appends "Restart_" automatically
MERGED_ODB="Restart_${ORIG_ODB}"
# If the merged file already exists, Abaqus throws an exception
if [ ! -f "$MERGED_ODB" ]; then
   abaqus restartjoin originalodb="$ORIG_ODB" restartodb="$RESTART_ODB" copyoriginal
fi
