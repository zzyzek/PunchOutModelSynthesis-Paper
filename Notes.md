Notes
===

Notes for myself.

---

Infallible Models
---

Merrell talks about "infallible" models in section 3.3.7 of the "Model Synthesis" dissertation.
The idea is that infallible models don't have the possibility of a contradiction and can always
find a resolution.

Merrell talks about methods of block choice etc. as well as some attempts at heuristics for
discovering when tile sets are infallible.

In terms of this paper, the infallible models should be mentioned.
I suspect something along the lines of:

> Merrell discusses ``infallible'' models where the tile constraints are conditioned so as to
> never be able to encouter a contradiction.
> Though infallible models represent a case that is always solvable, it's unclear how
> possible or how difficult it is convert tile constraints from exemplar scenes to infallible models.
> In particular, all tile sets considered in this paper are fallible models

The statement about solution phase transition shouldn't be made naked without the caveat about
infallible models.


Tileable Blocks
---

Merrell talks about using symmetries to create larger scenes.
For example, using translational, rotational or reflection symmetry to create larger scenes.
In particular, in certain cases, translational symmetry can be used to create an initial model
state to be fed into Merrell's Modify in blocks Model Synthesis (MMS).

This concept is obliquely mentioned in the paper with "engineering effort" but may want to be
put more explicitely or prominently.

To be more verbose:

* For wrap around tile constraints, this idea might work well as the smaller repeatable block
  might be easy to discover
* For hard edge condition tile constraints, this idea needs significant work to function
  - Many of the tile sets had an initial state created (through the set up restrictions)
    in one previous iteration, but these took a lot of effort to create and were not automated
    or generalized in any way
  - I'm skeptical as to how to automate this as finding a ground state is akin to finding a solution
    in the first place, so there's no real benefit
    + so maybe this should be mentioned more explicitely

So, I did mention this in the paper but it's I guess a subtle point.

* For some tile sets, under certain conditions, finding an initial state for MMS is probably not hard
  - Tile constraints with wrap around conditions might be easily discoverable with a modest block size
  - Hard constraints might be easily solveable in certain cases (e.g. Pill Mortal)
* For unbouned correlation length tile constraints, this will not work and is precisely why other
  methods (than MMS) are needed
  - not clear how to translate a template tile to create initial state
  - solution of initial state is tantamount to solution, which is precluded by MMS in the first place
  - just have moved complexity into the initial pre-processing stage without actually addressing it
    (as POMS/BMS attempts to do)

I believe this to be "novel research", so I'll have to figure out a way to communicate the limitations,
maybe in a more succinct way.

"Related Works" Section
---

I feel strongly about putting the related works section near the end (see references) but ultimately this
just might be doing the paper a disservice as reviewers expect related works to come immediately after the introduction.

([ref](https://homes.cs.washington.edu/~mernst/advice/write-technical-paper.html), [ref](https://www.youtube.com/watch?v=L_6xoMjFr70), [ref](https://people.eecs.berkeley.edu/~pattrsn/talks/writingtips.html))

Better Comparisons
---

I took more detailed comparisons out because of space constraints but maybe this should be put back in and
the "results" section can be paired down to not be so verbose and/or the tile rule construction can be reduced or removed.

Here's a rough idea of what I think is appropriate:

| Algorithm | Block Level Solver | Grid Level Solver | Contradiction Resiliance | Block Step Consistent | Initially Inderterminate State Allowed | Unrestricted Solution Space |
|---|---|---|---|---|---|---|
| WFC  | Yes | No  | No  | n/a | Yes | Yes |
| BMS  | Yes | No  | Yes | n/a | Yes | Yes |
| MMS  | No  | Yes | Yes | Yes | No  | No  |
| POMS | No  | Yes | Yes | No  | Yes | Yes |

Where the 'yes' quantities are generally desirable.
The double negative on the last column is not so great.


Shortening Results Exposition
---

There's a lot of text devoted to what the block size is, what the tile size is, etc.
This probably can be done in a table with references to it in each section of the results.

The results segmentation into bounded and unbouned TACCL might still be appropriate but only
mentioning the relevant bits about each tile set is probably the better use of space.

The tile size (stride) choice, the tile block window size, the boundary conditions, etc. can all
go into table 1, probably.
It might be worth defining "hard" and "wrap around" boundary conditions to save space.



