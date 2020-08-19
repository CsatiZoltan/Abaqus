# Input file


## Boundary conditions

The syntax for prescribing boundary conditions is described under the [*BOUNDARY](https://abaqus-docs.mit.edu/2017/English/SIMACAEKEYRefMap/simakey-r-boundary.htm#simakey) keyword.
In the data line, both a node set and an individual node is accepted.
Assume that you want to prescribe the value (0.3123, 0.3213) at node 11. You insert the following to your input file:
```
**
** STEP: Step-1
**
*Step, name=Step-1, nlgeom=NO, inc=1000
*Static
0.001, 1., 1e-08, 1.
**
** BOUNDARY CONDITIONS
**
*Boundary
11, 1, 1, 0.3123
11, 2, 2, 0.3213
```
This works fine if there is no [*INSTANCE](https://abaqus-docs.mit.edu/2017/English/SIMACAEKEYRefMap/simakey-r-instance.htm#simakey-r-instance) present.
If you open your input file in Abaqus/CAE, it automatically creates an instance as you can see it in the input file that Abaqus dumps when you select *Job -> Write Input* from the *Job* menu when the *Job* module is selected.
You will be surprised that if you append that input file with the code block above, Abaqus will throw the error
```
AbaqusException: Mesh does not exist This occurred while getting a region for a boundary condition. The boundary condition will be ignored.
```
and the boundary conditions you defined are indeed ignored.
It turns out that as soon as you have an *Instance*, you are left with two choices:
1. Insert the instance name before the node label, as hinted [here](https://www.eng-tips.com/viewthread.cfm?qid=307281):
   ```
   *Boundary
   Assembly.PART-1-1.11, 1, 1, 0.3123
   Assembly.PART-1-1.11, 2, 2, 0.3213
   ```
   where, `PART-1-1` is the name of the *Instance* created in Abaqus.
2. Create a node set for each boundary condition in the *Assembly* block, e.g.
   ```
   *Nset, nset=_PickedSet245, internal, instance=PART-1-1
   11
   ```
   and then you can give the boundary condition as
   ```
   *Boundary
   _PickedSet245, 1, 1, 0.3123
   _PickedSet245, 2, 2, 0.3213
   ```
   This second approach is what Abaqus does if you prescribe the boundary conditions from Abaqus/CAE.
