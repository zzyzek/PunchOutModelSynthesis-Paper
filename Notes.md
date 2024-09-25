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
put more explicitly or prominently.

To be more verbose:

* For wrap around tile constraints, this idea might work well as the smaller repeatable block
  might be easy to discover
* For hard edge condition tile constraints, this idea needs significant work to function
  - Many of the tile sets had an initial state created (through the set up restrictions)
    in one previous iteration, but these took a lot of effort to create and were not automated
    or generalized in any way
  - I'm skeptical as to how to automate this as finding a ground state is akin to finding a solution
    in the first place, so there's no real benefit
    + so maybe this should be mentioned more explicitly

So, I did mention this in the paper but it's I guess a subtle point.

* For some tile sets, under certain conditions, finding an initial state for MMS is probably not hard
  - Tile constraints with wrap around conditions might be easily discoverable with a modest block size
  - Hard constraints might be easily solvable in certain cases (e.g. Pill Mortal)
* For unbounded correlation length tile constraints, this will not work and is precisely why other
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

| Algorithm | Block Level Solver | Grid Level Solver | Contradiction Resilience | Block Step Consistent | Indeterminate Initial State | Ergodic |
|---|---|---|---|---|---|---|
| WFC  | Yes | No  | No  | n/a | Yes | Yes |
| BMS  | Yes | No  | Yes | n/a | Yes | Yes |
| MMS  | No  | Yes | Yes | Yes | No  | No  |
| POMS | No  | Yes | Yes | No  | Yes | Yes |

Where the 'yes' quantities are generally desirable.
Here, the term "ergodic" is used loosely.


Shortening Results Exposition
---

There's a lot of text devoted to what the block size is, what the tile size is, etc.
This probably can be done in a table with references to it in each section of the results.

The results segmentation into bounded and unbounded TACCL might still be appropriate but only
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


The following are notes to myself trying to address some of the reviewers concerns:

## Reviewer 1

### Fixable Weaknesses

> Why is this system being made? What are the use cases? How does this differ from other systems like it? What are the benefits? These questions should be brought up as early as possible in the paper and then answered through the description of the system, methodology, experiments, and results.

This seems to be mostly a critique on comparison to other methods in the area.

The benefits are listed directly as bullet points in the introduction.
The ways in which it differs or enhances other methods are addressed in the related work section.

The choice was made to focus on what the algorithm is rather than initially address what other algorithms exist and how it compares.

This is a running theme (see above) and, in my opinion, most likely stems from the choice to put *Related Work* at the end, rather than the beginning.

> What is the purpose of Figure 1? It's never mentioned in the paper and no context is provided for the games listed. What is Pill Mortal? What is Micro Forest (referred to as Forest Micro later, is this different?) It feels like it was just added just for the sake of having an image in the paper.

This seems unfair to me.
There are many papers that give a teaser image about what can be expected from the algorithm.
Images like this provide an anchor for people reading the algorithm to anticipate what can be done and what the goal is.

The names of the tile sets were listed (Micro Forest is mis-spelled and should have been "Forest Micro").
Naming the tile sets, especially as I'll be referencing them later in the paper, is appropriate.

> Although there are low-level definitions for the components of the system, the paper makes many assumptions about the reader's context level for procedural content generation and CBTG until the very end of the paper. Related work should go significantly earlier in the paper to provide context for unfamiliar readers.

This is the same critique as other reviewers and above.

> The description for Figure 2 is way too long and should instead be its own paragraph in the text. The figure itself should just provide a visual demonstration and serve as reference for the text.

No.

Figure 2 does have it's own paragraph in the text.

For people flipping through the paper, the graphic brings its own context so people don't have to hunt to find the description of it in a wall of paper text.

> The same above for Figure 4 and Figure 5 

Again no, for the same reason.

### Unfixable Weaknesses

> I can't tell how useful this new system is since there is no comparison against other CBTG systems for the same domains.

The comparison to Merrell's Model Synthesis and Gumin's WFC is directly made in the *Related Works* section.

I suspect the reviewer didn't get as far as the *Related Work* section or didn't read it.

> The benefits and the drawbacks for the system aren't proven in the "Results". Why would a developer or researcher use this system over other CBTG systems?

The focus was on describing the algorithm and how to use it to generate model realizations.

The limitations of the system are discussed (3.1 "... without wrap around boundary conditions
POMS has trouble finding solutions as the grid boundary
region is non trivial for this tile set.", 3.2 "... For large grid sizes, POMS fails to find realizations for the
Forest Micro tile set when a block choice policy is chosen
that weights unresolved grid positions equally.", to name a few).

Comparison to the two main CBTG systems, MMS and WFC, are discussed in the *Related Works* section.

See previous item.

> What is the design process for this system and the algorithms? Why is a erosion choice scheduler and block solver algorithm implemented? Why is it called POMS? There's no context or explanation for the components of the system.

From the introduction:

* "... If there is a finite length of correlation that one cell’s tile choice has with another, any contradiction that might appear during the course of resolution are localized to a region."
* "... Undoing previous cell realizations, via block region reversion or erosion, are done in the hopes of removing a localized contradiction."
* "... Different choices for block scheduling policies, different block based level algorithms and other strategies can help mitigate these shortcomings and will be briefly addressed (Section 3)."

I'm not sure I really need to justify the name but for future reference, here are some reasons I think are valid:

* "Punch Out Model Synthesis" is catchy and memorable (1980s video game reference)
* The block choice is effectively "punching out" a section of the grid to work on.
* The ability to backtrack and get out of a local minimum also gives another meaning to "punch out" as the algorithm can overcome the local minima

I think the last statement is unfair, as the above bullet points demonstrate.
I again suspect the reviewer was frustrated and didn't properly try to engage with the text to answer their concerns or questions.

Some issues are addressed directly while others I don't agree are unfixable weaknesses.

> What is the experiment design? Why were these domains chosen?

For better or worse the focus was on feasibility rather than a thorough examination of the probability of success and failures for an enumeration of different parameters.
Though I do agree this is desirable, due to space limitations and the context of where the paper was submitted, I did not pursue this avenue.
My feeling is that a more thorough examination is better suited to another paper.

Overall, chosen to be provide a wide range of tile sets "in the wild" where this algorithm can be used nearly "out of the box".
Further details:

* two of them have finite TACCL, with this case presumably being the 'easy' case for POMS
  - one of the two still has problems so the finite TACCL might be misleading, highlighting the shortcoming of the metric
* two of them have infinite TACCL but are still amenable to being solved with POMS
  - *Forest Micro* is directly referenced in the *Related Works* section and why MMS would fail to find realizations while
    POMS can
* one of them is 3D, highlighting the method is not limited to 2D
  - the 3D tile set has known infinite correlation length but finite TACCL, whereas the 2D (oarpgo) only has a suspected
    infinite correlation length but finite TACCL

This could be stated more explicitly.

I don't agree that this is an unfixable weakness.

> There's many custom definitions for the components of the system, but no justification for their existence.

The *Results* section discusses different Block Choice Schedulers and why they're necessary in the solution of some choices of tile sets.

The Erosion Choice Scheduler is pretty much fixed in its operation but was abstracted out because it didn't seem like a stretch.
The point is taken that this is maybe not something that should be prematurely abstracted away but I also don't think it's such
an impediment to anyone trying to understand the algorithm to overlook.

I don't agree these are unfixable weaknesses.

### Level of Detail

> The language of the paper is too detailed at times -- to the point where its easy to get lost in what the paper is trying to communicate. Funneling in information and using more high-level language instead of going directly into the weeds of the system would help.

This is fair. It's hard to understand what level of detail is appropriate at what point.

There's a tension between being correct and communicating effectively.
I try err on the side of correctness but there are most likely improvements or compromises to be had.

I suspect the reviewer is addressing an overall frustration so it's hard to know what to address their concerns
as the critique doesn't focus on any real part to be fixed.

> The definitions are thorough but could be supported with examples or diagrams.

I just don't know how to address this in a nine page paper.
The crumbs are there for people that want it.
I can't lavish attention on introductions to constraint satisfaction problems or computational complexity theory.

I tried to provide real estate to elements I thought were directly relevant to the paper.
Even the automatic rule deduction was a big compromise.


> Rather than immediately starting with what the system does in the introduction, providing some high level background about the overall problem or the current state of the art for constraint based tile generation would be helpful for context.

In other words, put the *Related Work* at the beginning.

> Why is there a subsection for Algorithm if there's only one?

Yes, fair, there should be no subsection... probably a hold over from a previous draft (yes, I think algorithm 2 might have been in the algorithms section at one point)?

> What does the results section mean? Results of what? An experiment or the implementation of the system? What is the experiment creating these results?

The results of running POMS on various tile sets.
Providing the results of running POMS on various tile sets in the *Results* section is an appropriate use of the word "results".

There is no experiment. This is a description of the algorithm.

The results of showing feasibility of success of running POMS on these tile sets is provide in the *Results* section.

Compare with MMS where this is a description of the algorithm with minimal focus on an experimental assay.
Compare with other papers in this area that provide an algorithm description and feasibility of some showcased runs.

> The paper doesn't follow a traditional format for a research paper, or even of other papers produced in this workshop, and reads more like a manual for a system. I'd recommend the authors refer to other papers in the field for proper formatting and readability.

In other words, put the *Related Works* section at the beginning.

I did refer to other papers for readability.
Better critiques will yield better results from me.
Venting general frustration without specific points for improvement is not helpful in creating a better paper.

> It's a very cool system, but it needs to be catered more for an academic audience, as this is an academic workshop. Sections should be re-ordered for clarity and more context and background should be given. The paper's writing needs heavy editing and organization before it could be published, even for an experimental AI workshop.

Another *Related Works* critique.

It looks like there's more of a general condemnation but it's hard to tease out what they're actually harping on, or where to improve.
This maybe is just a general vent from the reviewer who thinks the paper is a lost cause.

> Strengths SCORE: 4 (The contribution is interesting, and I would want to talk to authors about it at the coffee break.)
>
> Fixable Weaknesses SCORE: 3 (Would require some work to be put in condition acceptable for inclusion.)
>
> Unfixable Weaknesses SCORE: 3 (Minor unfixable weaknesses.)
>
> Overall Score SCORE: 0 (borderline paper)

Confusing. Paper is interesting, has fixable weaknesses, unfixable weaknesses are minor but, nope, overall flat out reject.

## Reviewer 2

### Fixable Weaknesses

Most I won't go through them here but they're all mostly likely valid and can be incorporated into the paper.

> The paper does not engage much with constraint satisfaction outside of the context of what is currently commonly used for game level generation. There are overlapping concepts between this paper and f.x. Markov random fields and other graph-based image processing techniques. The lack of engagement with this area of existing literature does make it difficult to evaluate the actual novelty and value of the paper.

IMO, some of this is fair.

* focusing on MRF is way outside of scope (more on this below)
* personally, I had major problems understanding what other areas could help in this regard
  - most belief propagation is not really used for this regular grid constraint satisfaction problems
  - most other algorithms in CSPs are overly general and used in arbitrary graph models
  - when regular grids are used, they're usually used for image segmentation, etc.
  - a lot of attention is given to MRFs with other, more restrictive assumptions (robust? Gaussian? something something Fourier transform?),
    which most likely is not appropriate for this domain
* even if there's adjacent work, the use in this domain is novel (level design, see WFC, MMS)

I agree, this good to bring up. Maybe I can forgo it because of the context and size limitations but it'd be nice to at least understand
how it fits better into the larger literature.

Some notes on MRF:

* (loopy) BP was tried and offered some success but:
  - has large memory footprint (message keeping)
  - takes time to converge
  - complex algorithms to help convergence (residual BP, splash, etc.)
  - doesn't provide enough of an inference boost to warrant the time/space/code complexity

BP also pretty much assumes a local tree-like structure on the graph, which these regular structures violate.
Splash BP, for example, imposes a min. span tree (I think?) to do inference but it's not clear if that'll really work in this
context, or if it does, how helpful it'll be.

Anyway, my view is that this is "novel research".

### Unfixable Weaknesses

> The work would be much stronger if there were an evaluation of the method compared to baselines(for example some of the works presented in the related works section). Metrics such as those used in the TRP paper [1] could be used, or the authors could perform an expressive range analysis [2] of the system ([1](https://ar5iv.labs.arxiv.org/html/2309.13071), [2](https://dl.acm.org/doi/10.1145/1814256.1814260))

Worth looking into. I hadn't heard about these.

Note there is some comparison with WFC and MMS.

IMO, the KL-divergence paper is a real attempt at trying to get at quantifying output (which I didn't engage with but to say it exists).

### Comments and Suggestions

> I think the ordering of sections could be changed to improve the narrative flow of the paper. It feels odd to have the related work section so late in the paper because it provides needed context for how the reader should be evaluating the proposed system. I would move this section to be between the introduction and algorithm sections.

*Related Work* should go at the beginning.


> Strengths SCORE: 4 (The contribution is interesting, and I would want to talk to authors about it at the coffee break.)
>
> Fixable Weaknesses SCORE: 4 (Minor weaknesses that are easily fixable.)
>
> Unfixable Weaknesses SCORE: 3 (Minor unfixable weaknesses.)
>
> Overall Score SCORE: 2 (accept)

## Reviewer 3

### Fixable Weaknesses

> It would be nice to have a formula for the Erosion Choice Scheduler approach.

Omitted due to space. Maybe consider putting in.

> In the definition of TAACL, it was unclear to me what "The maximum distance the cells in the grid are altered" means in this context. Is this referring to an edit distance? Or, just a Manhattan distance from the start grid to the furthest away modified grid cell?

Yes, I was vague, due to space mostly. Consider making this more rigorous.

The distance is Euclidean norm. I also sidestepped the anisotropy, which further confounds the choice.

Consider addressing this head on more. The Euclidean norm should at least be explicitly mentioned.

> Are the TAACL plots in Figure 5 heat maps computed after a number of simulation runs with different initial grid configurations? If so, how many simulation runs are there? If not, I'm confused as to how the TAACL values in these grids can be as high as 10^6, since none of the grid examples shown appear to have a "distance" which can be so large. Also, I went to reference [1] to seek more detail here, and the sketch of TAACL provided in Breakout-Model-Synthesis.md section "Radius of Influence" wasn't enough to address more detailed questions.

Yes, confusing.

TACCL plots done in an isolated system and are the results of *Algorithm 2*. I can see how putting them next to the highlighted runs is confusing.
The note about how the TACCL plots are made should be in the description.

The reference is to an effectively unpublished work-in-progress code base.
The original ideas were developed and published there.
Credit was given because it's due but it's not a rigorous treatise, introduction or print-ready publication.

Regardless, TACCL needs more attention here to avoid confusion.


> Strengths SCORE: 4 (The contribution is interesting, and I would want to talk to authors about it at the coffee break.)
>
> Fixable Weaknesses SCORE: 4 (Minor weaknesses that are easily fixable.)
>
> Unfixable Weaknesses SCORE: 4 (No unfixable weaknesses.)
>
> Overall Score SCORE: 3 (strong accept)

## Review

I think this is par for the course?
I remember hearing somewhere there's one reviewer who hates it, one reviewer who finds it acceptable but thinks it should have
some other orthogonal ingredient in it and on reviewer who's rooting for it?

Anyway, thanks to the anonymous reviewers, your feedback is much appreciated.




---

Actionable items:

#### wip

* Shorten results exposition (wip)
* Explicitly mention TACCL calculation in figure (wip)
  - make sure to include Euclidean distance
  - try to make it as clear as possible
  - address the anisotropy, even if to say "eyeballing it, taking maximum in one direction"

#### done

* Move *Related Work* to beginning. (done)
  - Nice to experiment but it's a resounding failure. Every single reviewer scoffed at it. Merrell scoffed at it. I like it at the end but its too jarring to keep in.
* Put the comparison table in (done)
* Put in blurb about infallible models (done)
* Consider discussing MMS ("Tileable Blocks" above) (done, mostly)
* Reviewer 2 suggestions
	- In the introduction section, change “set up” to “setup”. (done)
	- In the definitions section, italicize “support from a direction” instead of just “support” to further differentiate from “has support” which is defined later in the paragraph. (done)
	- In the definitions section, elaborate on what it means to “hold up to D tiles”, f.x. Changing it to “hold a superposition of D tiles while unresolved” for clarity. (done?)
	- In the definitions section, the acronym Arc Consistent (AC) is defined four times in a short span in the third and fourth last paragraphs. This is unnecessary. (done?)
	- In the description section, I would move the first paragraph lower as it is a bit uncomfortable to start a section with references to figures and algorithms. The section would be easier to read if it were moved below the paragraph that is currently the second paragraph in the section. (done?)
  - if you don't take these suggestions, have a good reason not to

