# Command line tricks





## Killing locked-in processes

I experienced on Linux (using `htop`) that even after killing a job, processes remain in memory. If you use Abaqus/Standard, the executable is called `standard`. You can kill those processes with
```bash
killall standard
```

