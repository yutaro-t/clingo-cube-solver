# CLINGO Cube Solver

Experimental rubik cube solver using CLINGO.

## Simulation

Create a CLINGO file that defines occurs/2, where `occurs(turn(FACE, AMOUNT), T)` means turning `FACE` 90*`AMOUNT` degrees at time `T`. `FACE` is one of u, d, r, l, f, b. You should also define `h`, which is the number of steps you want to simulate. In addition, include `rub3x3.lp` and `simulate.lp`.

### The result

The result will be shown in predicate final_print/1. The argument is either `loc` or `perm`. `loc(A, B)` means that block that use to be in the position `A` is located in `B`. The label for the location is as follows:

```
             |************|
             |*13** 1**14*|
             |************|
             |* 4** U** 2*|
             |************|
             |*16** 3**15*|
             |************|
 ************|************|************|************
 *13** 4**16*|*16** 3**15*|*15** 2**14*|*14** 1**13*
 ************|************|************|************
 * 8** L** 5*|* 5** F** 6*|* 6** R** 7*|* 7** B** 8*
 ************|************|************|************
 *20**12**17*|*17** 9**18*|*18**10**19*|*19**11**20*
 ************|************|************|************
             |************|
             |*17** 9**18*|
             |************|
             |*12** D**10*|
             |************|
             |*20**11**19*|
             |************|
```
`perm(A, N)` means that block that use to be in the position `A` is twisted clockwise `N` times.(Therefore N < 2 for edge pieces and N < 3 for corner pieces.) For any block that has no `loc` or `perm` specified, the location and permutation is as same as the default state.

### Specifying initial state

If you want to specify a initial state, add init/1, where the argument is either `loc` or `perm`. Specify the arguements for `loc` and `perm` in the same way as defined above. If you do not specify the location or permutation, the blocks are located or permutated in the default state.

## Finding Algorithm

Create and execute a file with definition of init/1 include `rub3x3.lp` and `find.lp`. How to define init/1 is written in the previous section.

### **Warning!!**

The execution will likely to take extremely long time. Please either make the maximum number of steps `h` shorter, or limit the possible turns. To limit the possible turns, add constraint for Action/1, such as:

```Prolog
% Prohibiting B face turns.
:- Action(turn(b, N)), N=1..3.

% Prohibiting F face turns except for F2 turn.
:- Action(turn(f, 1)). :- Action(turn(f, 3)).
```

## Simulating and Finding algorithm for 2x2x2 cube

Use `rub2x2.lp` instead of `rub2x2.lp`.

## Reference

[Answer Set Programming(Draft) - Vladimir Lifschitz](https://www.cs.utexas.edu/~vl/teaching/378/ASP.pdf)
