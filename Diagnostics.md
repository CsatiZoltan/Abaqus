# Diagnostics

Diagnostics help in [understanding the convergence behavior](https://abaqus-docs.mit.edu/2017/English/SIMACAECAERefMap/simacae-m-Output-sb.htm).

For detailed diagnostic output, use the [*DIAGNOSTICS](https://abaqus-docs.mit.edu/2017/English/SIMACAEKEYRefMap/simakey-r-diagnostics.htm#simakey-r-diagnostics) keyword.

To view the diagnostic information in the GUI (i.e. Abaqus/CAE), select the *Visualization* module, load your .odb file and then *Tools* --> *Job Diagnostics...* The advantage of using the GUI is that you can display the problematic part (e.g. node where the residual is the largest) in the body. The [message file](https://abaqus-docs.mit.edu/2017/English/SIMACAEOUTRefMap/simaout-c-output.htm#simaout-c-output-message) (.msg) also contains the diagnostic information. The frequency of outputting information can be adjusted in the [*PRINT](https://abaqus-docs.mit.edu/2017/English/SIMACAEKEYRefMap/simakey-r-print.htm#simakey-r-print) keyword.

For other output files, see the [*Output files*](./OutputFiles.md) section.
