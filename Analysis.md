# Analysis



## Restarting an analysis

[Scenarios](https://abaqus-docs.mit.edu/2017/English/SIMACAEANLRefMap/simaanl-c-restart.htm) when you want to restart an analysis include:

- restart from the middle of a step ([example here](https://abaqus-docs.mit.edu/2017/English/SIMACAECAERefMap/simacae-c-anaconcrestartmiddle.htm))
- continue an interrupted run ([example here](https://abaqus-docs.mit.edu/2017/English/SIMACAECAERefMap/simacae-c-anaconcrestartstandard.htm))
- continue with additional steps ([example here](https://abaqus-docs.mit.edu/2017/English/SIMACAECAERefMap/simacae-c-anaconcrestartaddmore.htm))
- change an analysis ([example here](https://abaqus-docs.mit.edu/2017/English/SIMACAECAERefMap/simacae-c-anaconcrestartmodsome.htm))

In order to perform a restart, you must first create an output request, which will write the required information to files. In   Abaqus/Standard these files are the restart (.res; file size limited to 16 GB), analysis database (.mdl and .stt), part (.prt), output database (.odb), and linear dynamics and substructure database (.sim) files. These files, collectively referred to as the restart files, allow an analysis to be completed up to a certain point in a particular run and restarted and continued in a subsequent run. To create an output request for restart, do one of the following:

-  in Abaqus/CAE select the *Job* module and then the *Output* --> *Restart Requests...*
-  in the input file, within the [*STEP](https://abaqus-docs.mit.edu/2017/English/SIMACAEKEYRefMap/simakey-r-step.htm#simakey-r-step) block, give the [*RESTART](https://abaqus-docs.mit.edu/2017/English/SIMACAEKEYRefMap/simakey-r-restart.htm#simakey-r-restart) keyword with the WRITE option.

Once you have run your analysis, the necessary files have been created. Now, you can restart the analysis by performing one of the following:

-  in Abaqus/CAE select the your model in the *Model* --> *Copy Model* menu. Then select the newly created model in the *Model* --> *Edit Attributes* menu. Give the name of the old job (not the file name) on the *Restart* tab, along with the desired restart location. In the *Job* module create a new job from the copied model and make sure that the *Restart* radio button is active on the *Submission* tab.

-  create a new input file that contains the *RESTART keyword with the READ option, appearing as model model data (normally the first keyword in the input file after the HEADING keyword).

   Example:

   ```
   *HEADING
   *RESTART, READ, STEP=1, INC=4
   *STEP, INC=120
   *STATIC, DIRECT
    0.1, 0.6
   *CLOAD
    1, 2, 20.0
   *END STEP
   ```

   To submit the restart analysis, use the command line: `abaqus job=job-name oldjob=oldjob-name`.

When you restart an analysis, Abaqus creates a new output database file (job-name.odb) and a new results file (job-name.fil), and writes output data to those files. To merge the original and new .odb and .fil files, use the [`abaqus restartjoin`](https://abaqus-docs.mit.edu/2017/English/SIMACAEEXCRefMap/simaexc-c-restartjoinproc.htm) and [`abaqus append`](https://abaqus-docs.mit.edu/2017/English/SIMACAEEXCRefMap/simaexc-c-appendfil.htm) commands, respectively. Example:

```
abaqus restartjoin originalodb=Job-1.odf restartodb=Job-1_res.odb
```
```
abaqus append job=job-name oldjob=oldjob-name input=input-file
```
Note that a restart analysis in Abaqus must be run on a computer that is binary compatible with the computer used to  generate the restart files.
