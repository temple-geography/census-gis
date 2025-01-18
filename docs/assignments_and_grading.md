# Assignments & Grading

This course will make use of a variant of [Specification Grading](https://sites.temple.edu/hachadoorian/specification-grading/). This means that many assignments will be graded Complete/Incomplete or assigned a provisional grade, and in some cases will merely be returned with comments. Assignments marked Incomplete or not awarded full points may be revised and resubmitted. Quizzes can be retaken until passed, unless otherwise specified.

You will earn points along several **tracks**. Each track is worth up to 100 points. You must progress along ***ALL*** tracks to be successful in this course. Your final grade is based on the ***lowest*** score earned along any track.

Tracks proceed linearly and assignments usually need to be completed in the designated order. For example, for quizzes, the material is cumulative, and you can't earn credit for Quiz 4 if you haven't passed Quiz 3. Often, later assignments in a track presume knowledge you will have acquired by completing earlier assignments.

Some assignments proceed in milestones. In each case, you must proceed along the milestones in order. For example, for a term project, there will often be an initial topic statement, followed by an annotated bibliography (for a paper) or analysis plan (for an analytical project), a draft, and a final report. You cannot submit an annotated bibliography if your topic statement has not been approved, and you cannot submit a draft or final report if you haven't submitted an annotated bibliography or analysis plan.

Grading will conform to the following scale:

* A 93%+
* A- 90 - <93%
* B+ 87 - <90%
* B 83 - <87%
* B- 80 - <83%
* C+ 77 - <80%
* C 73 - <77%
* C- 70 - <73%
* D+ 67 - <70%
* D 63 - <67%
* D- 60 - <63%
* F <60%

## Attendance

0-100 points. Your attendance score is a straight percentage of class session you are present for.

This course meets once a week. Missing *any* class meetings will hamper your ability to complete the work in this course. High-performing students tend to be the ones who attend all class meetings. Struggling students may be struggling for a variety of reasons, but for many of them, lack of attendance is a contributing factor. Your attendance percentage will also indicate the maximum final grade you can earn in this course. If you miss 3 classes, you have attended 78.6% of class meetings. Accordingly, your final grade will not be higher than a C+, *regardless of any other work completed*.

An exception is that missing one class (attending 92.9% of class meetings) will still earn an A in the Attendance Track.

## Lab Exercises

5 to 10 points per exercise. In general, a 10 point exercise is a more complex exercise that will take more time to complete. Point value is TBD for three Special Topics exercises later in the semester. Base score for this track will be determined when those exercises are finalized.

### Pick a State

At the beginning of the term you will choose a state from a list supplied by the instructor (the smallest and largest states will be excluded) as your area of study for the semester. For the remainder of the term, you will complete the textbook exercises using data for your state, or if the textbook analyzes an individual city city, metropolitan area, etc., you will analyze a city or metropolitan area in your state. Additional guidance will be provided where relevant.

### Data Year

Both textbook were published before 2020 Census 2020 data was available, and use Census and American Community Survey data from a few years ago. When reproducing textbook exercises you should use 2020 Census data and 2023 American Community Survey data. Other (Census or non-Census) datasets may also have more recent versions. Lab exercises should make clear what versions to use, but if you unsure what data year you should be using, please ask.

### A Note on Spreadsheet Exercises

Note that many spreadsheet exercises in the textbook make use of rounding, and also multiply fractions by 100 to generate percentages. As a general rule, do not round, and do not multiply by 100. Instead, use cell formatting to display fractions as percentages, and to limit the number of decimals displayed.

### A Note on Census API Keys

Tidycensus requires you to use your Census API key to download data. You should not give out the API key, and should omit the `census_api_key()` call in the scripts you submit for grading. If you follow the textbook instructions to "install" the Census API key on your personal computer, you should only have to call `census_api_key()` once anyway, and shouldn't need to run it for each assignment.

### Deliverables

Lab deliverables will be clearly specified and may include spreadsheets, R code, images (use PNG where possible), PDFs, etc.

### List of Exercises

* Exercise 1 (5 points): Exploring Census Data with Tidycensus
* Exercise 2a (5 points): Generational Categories
* Exercise 2b (5 points): Estimating Seasonal Populations
* Exercise 3a (10 points): QGIS Exercise
* Exercise 3b (5 points): Map-Making with Tmap
* Exercise 4 (5 points): Relating Group Quarters and Rural Categories
* Exercise 5 (5 points): Aggregating Tract-Level Estimates to Neighborhoods
* Exercise 6 (5 points): Business Datasets
* Exercise 7 (TBD points): Special Topics 1
* Exercise 8 (TBD points): Special Topics 2
* Exercise 9 (TBD points): Special Topics 3

## Student-Led Tutorial (graduate only)

70 (base score) + up to 30 points.

Assignment to be detailed later.

## Term Project

**Undergraduate Students**

50 (base score) - 100 points.

Undergraduates will earn milestone points for a Project Proposal, Methods, Draft, Poster Presentation, and Final Report, as detailed below.

**Graduate Students**

40 (base score) - 100 points.

Graduate students will serve as principal investigators and team leaders for the Term Projects. Graduate students will earn milestone points for all undergraduate milestones plus a Literature Review, as detailed below.

_________________________________

The Term Project is an open topic project completed in teams of three to four students. Teams must be approved by me, and will be organized partially based on topical interest but also based on level (grad/undergrad) and previous software experience.

Graduate students will serve as team leaders. Each team will have 1-2 graduate students and 1-2 undergrads, depending on the ratio of grads to undergrads in the class. (If there is an unusual ratio of grads to undergrads, grad-only or undergrad-only teams are possible, or smaller or larger teams are possible.) At the beginning of the semester, graduate students will discuss project ideas with the instructor and each other, and the number of teams and topics will be determined. Graduate students will then pitch their ideas to the undergraduates, who will join teams with instructor keeping team sizes reasonably balanced.

The research idea must make use of data from at least one Census data product. Usually, this will be the American Community Survey, which has a richer set of variables than the Decennial Census. Additional data must also be incorporated from different time points or from different topical sources (which may be other Census data products, or data from other government agencies or private entities). Other Census data products, such as American Housing Survey or Census of Governments *may* serve as a sole data source for a project, as these are very rich datasets.

* Census or ACS data may be combined with other public data sources. For example:
    * Crime points can be allocated to Census tracts to determine crime prevalence by neighborhood.
    * Building permit data can be combined with demographic data for an analysis of gentrification.
    * Land cover data can be combined with demographic data in order to analyze sprawl and its environmental impacts.
* Census and/or ACS data from multiple time points can be combined for historical or prospective analysis:
    * Sun belt migration, and possible return migration could be visualized and studied.
    * White flight, and a possible urban return (the "great inversion") could be visualized and studied.

Many other ideas are possible.

The final report should follow the structure of an empirical research paper with the following sections:

* Abstract
* Introduction
* Literature Review
* Methods
* Results
* Discussion

Note that often the lit review is included in a paper introduction. For this project, the it review is a grad-only milestone, and is broken out separately. The introduction is considered part of the collaborative team writing.

Your final project should include the following elements:

* A 3000-5000 word paper (approximately 12-20 pages double-spaced). Figures and tables (see below) do not count toward the word count. Remember that this is a group project, so this should translate into about 4 pages of writing per person (with some additional requirements for the graduate students), but will require you to structure your paper so that the sections work together cohesively.
* At least six *original* figures, of which at least three have to be maps. The others may be additional maps or charts and graphs based on your data.
* At least two mathematical manipulations of your data, e.g. calculation of a crime rate, index of dissimilarity, or more complex model like a travel demand forecast.
* If you have a team member with a background in statistics, consider including one OLS regression if appropriate to your data. More complex models such as spatial regression, cluster analysis, GWR, etc., are allowable.

Remember that these are *minimums*. A project with more than six figures is common, and projects with *many* mathematical manipulations are also common. If you do any statistical modelling, alternative specifications are also common in empirical research.

Although you can use any software you want for writing, I strongly recommend using Google Docs for collaborative editing. The paper should use Chicago author-date in line citation style. I strongly recommend using a reference manager, and specifically recommend Zotero (<https://www.zotero.org/download/>), which integrates with Google Docs (as well as other word processors) for automated citation formatting. If the class wishes, the instructor can demo the use of Zotero at some point during the semester.

Your final course grade will be determined by completion of the following milestones:

### Milestone 1: Project Proposal (5 points)

This is a description of the topic, analysis you intend to perform, data you will use, and background of the problem. It is short, but should use a standard research citation style. It should include:

* Title
* An approximately 500 word abstract, including a general description of the problem or question you are going to address and a brief description of the background (why you chose this problem/question)
* One or two references to previous research.
* Data you will use, including citation of specific data sources. Data could be specific ACS tables, specific variables of interest, etc. Even if using data products introduced in this class, such as the ACS, provide a full citation to the data. Include URLs in your citation.
* Methods you may use to address the question. This may change as you begin your work, but if you are trying to do something that has never been done before, that might be an indication you are biting off more than you can chew.

For this project, it is fine to use *only* American Community Survey data, as long at the project uses multiple ACS data years for a change-over-time analysis. For a multi-decade study, it is common to combine ACS data with long-form (SF3) Census data from 2000 or earlier, when the ACS did not exist. If your project is at a single point in time, you must combine ACS (or Decennial Census) data with other sources of data, which may be other Census data products, or data from other government agencies or private entities.

The project proposal must be approved before you can move on to Milestone 2a and 2b.

### Milestone 2a: Methods (10 points)

This milestone will be an early draft of the methods section of your final report. This section will double as a proposal for the analysis you *intend* to do. It does not have to be final, and as you work on your project, you may alter or add to these methods. If your final methods section diverges wildly from your proposed methods, that *may* be an indication of a project that went off the rails, but it is also possible that early exploratory analysis indicated that the intended methods were not appropriate to the analytical questions. The instructor will give you feedback on the proposed methods, and we will be in conversation throughout the semester, so you will have ample opportunity to refocus with feedback from the instructor.

The Methods section should also describe your data, with references. As such, it may recapitulate information included in Milestone 1, but you may have incorporated more or different data sources in your project planning.

Consider including a flowchart or other graphical representation of your analysis pipeline.

#### Deliverables

An approximately 1000 word writeup of the proposed methods, with reference to the relevant literature where appropriate.

Milestone 2a must be completed before you can submit a draft report.

### Milestone 2b (graduate only): Literature Review (10 points)
    
Only graduate students complete this milestone,

This is a review of the literature relevant to your problem statement. Guidance on writing a literature review is available at <https://guides.temple.edu/c.php?g=553329&p=3801509>, which, although it is not specific to this course, is general enough to be applicable to any literature review.

#### Deliverables

An approximately 1000 word literature review with at least 8 academic citations to previous research in this area.

Milestone 2b should be completed before your draft report.  However, the project will be allowed to progress without a literature review.

### Milestone 3: Draft Report (5 points)

The draft should be a *nearly* complete version of the final report, possibly with interim or provisional results. Sections of the final report interim report is a description of work completed so far and work remaining. You should include:

1. Introduction - This should be a full draft of your introduction.
2. Literature Review - This should be a revised version of Milestone 2b, which should have been submitted previously.
3. Methods - This should be a revised version of Milestone 2a. If your methods have changed, this draft should reflect the methods you are actually using.
4. Results - You should have some preliminary results by this point. Results may include regression tables. maps, statistical visualization, etc.
5. Discussion - This section will be a very early draft of your discussion and conclusions. In fact, it may be completely missing. However, it will be best if you have *something* for this section. It should include some interpretation of your results or discussion of the research implications or policy implications. It may lack a conclusion, or the usual discussion of limitations or future research direction.

The draft is an opportunity for me to see your progress and provide constructive commentary. Accordingly, it is evaluated *only* on timeliness. It is worth 5 points, with 1 point deducted for each day late.

This is a lot of work for 5 points, but this is really just a stepping stone toward the final report, which is where the substantive evaluation will take place. Furthermore, the draft report is in some sense "worth" more than 5 points, because it may be very difficult to earn maximum points on the final report without my feedback from the interim report.

#### Deliverables

A draft, with figures and appropriate bibliographic citation , of the 3000-5000 word final report, with caveats as given above. As a draft, it *may* be shorter, but the closer to full-length that you make it, the more there is for the instructor to provide feedback on, and the stronger your final draft will be.

### Milestone 4: Project Presentation (10 points)

In the final class meeting, you will present your research and results in a public poster presentation. The poster presentation will take place over about an hour in conjunction with posters presented by other GENUS courses and PSM in GIS Capstone Projects. The poster should include maps or figures which will appear in your final report. The research team will stand with their poster and discuss their methods and results with interested viewers.

The poster must be submitted for my feedback one week prior to the public presentation.

Evaluation will be based on scientific communication: layout, effective graphics, error-free text, and speaking confidently about your work.

### Milestone 5: Final Report (20)
    
The final report must meet all requirements set out above regarding length, sections, data sources, number of figures, etc.

