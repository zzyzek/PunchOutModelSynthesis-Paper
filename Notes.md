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


---

###### 2024-09-23

This paper has been accepted to AIIDE (20)24.
In the spirit of transparency, I'm including the email and review feedback.

```
AIIDE-24 notification for paper 74
From AIIDE-24 on 2024-09-23 21:58

Dear Zzyv Zzyzek,

Congratulations! We are happy to inform you that your submission (#74) has been accepted for presentation at the Eleventh Experimental Artificial Intelligence in Games Workshop at the Twentieth AAAI Conference on Artificial Intelligence and Interactive Digital Entertainment (AIIDE-24) to be held at the University of Kentucky on November 19th, 2024.

Please find below the reviewer's comments and make any necessary updates to the paper before submitting the camera-ready version. The deadline for submitting the camera-ready version is October 14th. We will send out further details in the coming days.

At least one author must register for the workshop and be available to present. Presenters are not required to register for the entire conference. Presentations are scheduled to be in person at the University of Kentucky, but please let us know as soon as possible if you require an online presentation, and we will do our best to accommodate you. Registration information is available at https://sites.google.com/gcloud.utah.edu/aiide-2024/registration. All papers will be scheduled for presentation on November 19th, 2024.

If you have any questions or concerns, please contact the EXAG organizing committee.

Thank you for submitting your paper to the workshop. We look forward to seeing you at the workshop!

Best regards,

EXAG Organizing Committee
Emily Halina <ehalina@ualberta.ca>
Johor Jara Gonzalez <jaragonz@ualberta.ca>
Mira Fisher <mira.fisher@uky.edu>

SUBMISSION: 74
TITLE: Punch Out Model Synthesis: A Stochastic Algorithm for Constraint Based Tiling Generation


----------------------- REVIEW 1 ---------------------
SUBMISSION: 74
TITLE: Punch Out Model Synthesis: A Stochastic Algorithm for Constraint Based Tiling Generation
AUTHORS: Zzyv Zzyzek

----------- Paper Contributions -----------
- This paper introduces a novel method for constraint based tile generation. The authors apply their method to a variety of tilesets.
----------- Audience and Relevance -----------
- The paper and system is very relevant for content generation developers and game designers who work with grid-world domains.
----------- Strengths -----------
- The paper is thorough in the description of the system and the algorithm, which allows for reproducibility.
- The system is applied to many domains to showcase its efficacy for grid-world environments.
----------- Fixable Weaknesses -----------
- Why is this system being made? What are the use cases? How does this differ from other systems like it? What are the benefits? These questions should be brought up as early as possible in the paper and then answered through the description of the system, methodology, experiments, and results.
- What is the purpose of Figure 1? It's never mentioned in the paper and no context is provided for the games listed. What is Pill Mortal? What is Micro Forest (referred to as Forest Micro later, is this different?) It feels like it was just added just for the sake of having an image in the paper.
- Although there are low-level definitions for the components of the system, the paper makes many assumptions about the reader's context level for procedural content generation and CBTG until the very end of the paper. Related work should go significantly earlier in the paper to provide context for unfamiliar readers.
- The description for Figure 2 is way too long and should instead be its own paragraph in the text. The figure itself should just provide a visual demonstration and serve as reference for the text.
- The same above for Figure 4 and Figure 5 
----------- Unfixable Weaknesses -----------
- I can't tell how useful this new system is since there is no comparison against other CBTG systems for the same domains.
- The benefits and the drawbacks for the system aren't proven in the "Results". Why would a developer or researcher use this system over other CBTG systems?
- What is the design process for this system and the algorithms? Why is a erosion choice scheduler and block solver algorithm implemented? Why is it called POMS? There's no context or explanation for the components of the system.
- What is the experiment design? Why were these domains chosen?
- There's many custom definitions for the components of the system, but no justification for their existence.
----------- Level of Detail -----------
- The language of the paper is too detailed at times -- to the point where its easy to get lost in what the paper is trying to communicate. Funneling in information and using more high-level language instead of going directly into the weeds of the system would help.
- The definitions are thorough but could be supported with examples or diagrams.
----------- Comments and Suggestions -----------
- Rather than immediately starting with what the system does in the introduction, providing some high level background about the overall problem or the current state of the art for constraint based tile generation would be helpful for context.
- Why is there a subsection for Algorithm if there's only one?
- What does the results section mean? Results of what? An experiment or the implementation of the system? What is the experiment creating these results?
- The paper doesn't follow a traditional format for a research paper, or even of other papers produced in this workshop, and reads more like a manual for a system. I'd recommend the authors refer to other papers in the field for proper formatting and readability.
- It's a very cool system, but it needs to be catered more for an academic audience, as this is an academic workshop. Sections should be re-ordered for clarity and more context and background should be given. The paper's writing needs heavy editing and organization before it could be published, even for an experimental AI workshop.
----------- Strengths -----------
SCORE: 4 (The contribution is interesting, and I would want to talk to authors about it at the coffee break.)
----------- Fixable Weaknesses -----------
SCORE: 3 (Would require some work to be put in condition acceptable for inclusion.)
----------- Unfixable Weaknesses -----------
SCORE: 3 (Minor unfixable weaknesses.)
----------- Overall Score -----------
SCORE: 0 (borderline paper)


----------------------- REVIEW 2 ---------------------
SUBMISSION: 74
TITLE: Punch Out Model Synthesis: A Stochastic Algorithm for Constraint Based Tiling Generation
AUTHORS: Zzyv Zzyzek

----------- Paper Contributions -----------
The paper proposes a constraint-based tiling generation algorithm, Punch Out Model Synthesis (POMS), that mitigates some of the shortcomings of other constraint-satsifaction solvers used for the generation of such things as video game levels and tilings. The authors run a reference implementation of this proposed algorithm and show its results on five tilesets, four 2D and one 3D.
----------- Audience and Relevance -----------
The writing style indicates the target audience of this paper is primarily academics, although the content of the paper may be relevant to both academics and practitioners. This paper is relevant to the AIIDE community and particularly EXAG as constraint-based tiling generation can be used in the development of games.
----------- Strengths -----------
The POMS algorithm is presented and explained in a reasonably reproducible manner. The authors further state they will provide source code which is a strength. The authors show a reference implementation on several tilesets that are commonly used in this field and perform a correlation length analysis to analyze the algorithm further. The proposed algorithm seems interesting and worth running further experiments on.
----------- Fixable Weaknesses -----------
The writing is fine across most of the paper, but there are some small changes which could improve the overall readability. I would like to make the following suggestions:

In the introduction section, change “set up” to “setup”.
In the definitions section, italicize “support from a direction” instead of just “support” to further differentiate from “has support” which is defined later in the paragraph.
In the definitions section, elaborate on what it means to “hold up to D tiles”, f.x. Changing it to “hold a superposition of D tiles while unresolved” for clarity.
In the definitions section, the acronym Arc Consistent (AC) is defined four times in a short span in the third and fourth last paragraphs. This is unnecessary.
In the description section, I would move the first paragraph lower as it is a bit uncomfortable to start a section with references to figures and algorithms. The section would be easier to read if it were moved below the paragraph that is currently the second paragraph in the section.

The paper does not engage much with constraint satisfaction outside of the context of what is currently commonly used for game level generation. There are overlapping concepts between this paper and f.x. Markov random fields and other graph-based image processing techniques. The lack of engagement with this area of existing literature does make it difficult to evaluate the actual novelty and value of the paper.
----------- Unfixable Weaknesses -----------
The work would be much stronger if there were an evaluation of the method compared to baselines(for example some of the works presented in the related works section). Metrics such as those used in the TRP paper [1] could be used, or the authors could perform an expressive range analysis [2] of the system

[1] https://ar5iv.labs.arxiv.org/html/2309.13071
[2] https://dl.acm.org/doi/10.1145/1814256.1814260
----------- Level of Detail -----------
Nothing outside of what is listed in fixable weaknesses.
----------- Comments and Suggestions -----------
I think the ordering of sections could be changed to improve the narrative flow of the paper. It feels odd to have the related work section so late in the paper because it provides needed context for how the reader should be evaluating the proposed system. I would move this section to be between the introduction and algorithm sections.
----------- Strengths -----------
SCORE: 4 (The contribution is interesting, and I would want to talk to authors about it at the coffee break.)
----------- Fixable Weaknesses -----------
SCORE: 4 (Minor weaknesses that are easily fixable.)
----------- Unfixable Weaknesses -----------
SCORE: 3 (Minor unfixable weaknesses.)
----------- Overall Score -----------
SCORE: 2 (accept)



----------------------- REVIEW 3 ---------------------
SUBMISSION: 74
TITLE: Punch Out Model Synthesis: A Stochastic Algorithm for Constraint Based Tiling Generation
AUTHORS: Zzyv Zzyzek

----------- Paper Contributions -----------
The paper describes Punch Out Model Synthesis (POMS), an approach for tile-based procedural generation where pairwise (one-hop) tile co-occurrence constraints are satisfied. The paper additionally uses Tile Arc Consistent Correlation Length (TACCL) to help evaluate the algorithm's behavior on different tile sets.
----------- Audience and Relevance -----------
This paper is relevant to researchers with interest in tile-based procedural content generation (including wave function collapse) and also to industrial practitioners who are interested in using tile-based generation algorithms in their games. The paper is very relevant to the AIIDE community.
----------- Strengths -----------
* The POMS algorithm, and its description in terms of block-level and grid-level solving activities.
* Use of Tile Arc Consistent Correlation Length (TACCL) to evaluate POMS behavior
* Evaluation of POMS using multiple 2D and one 3D tile set examples
* Nice pocket summary of recent work in the tile-based generation field
----------- Fixable Weaknesses -----------
* It would be nice to have a formula for the Erosion Choice Scheduler approach.
* In the definition of TAACL, it was unclear to me what "The maximum distance the cells in the grid are altered" means in this context. Is this referring to an edit distance? Or, just a Manhattan distance from the start grid to the furthest away modified grid cell?
* Are the TAACL plots in Figure 5 heat maps computed after a number of simulation runs with different initial grid configurations? If so, how many simulation runs are there? If not, I'm confused as to how the TAACL values in these grids can be as high as 10^6, since none of the grid examples shown appear to have a "distance" which can be so large. Also, I went to reference [1] to seek more detail here, and the sketch of TAACL provided in Breakout-Model-Synthesis.md section "Radius of Influence" wasn't enough to address more detailed questions.
----------- Unfixable Weaknesses -----------
None.
----------- Level of Detail -----------
As described above, more detail on the TAACL distance calculation and ESC formula would be beneficial.
----------- Comments and Suggestions -----------
None.
----------- Strengths -----------
SCORE: 4 (The contribution is interesting, and I would want to talk to authors about it at the coffee break.)
----------- Fixable Weaknesses -----------
SCORE: 4 (Minor weaknesses that are easily fixable.)
----------- Unfixable Weaknesses -----------
SCORE: 4 (No unfixable weaknesses.)
----------- Overall Score -----------
SCORE: 3 (strong accept)


```

