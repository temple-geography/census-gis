# Exercise: SQL Aggregate Query

These queries should be run against the Open Source Shakespeare database.

Each query should be run against a single table (i.e, no joins are necessary). You will not need to use the `wordform` table to answer any of these questions. All of these queries require the use of [aggregate functions](https://www.postgresql.org/docs/current/static/functions-aggregate.html). Most require the use of the `GROUP BY` clause, as well.

Your exercise should be submitted as one SQL script file. Use semicolons to terminate SQL statements. Use comments to indicate Question 1, Question 2, etc. You may also find it useful to copy the entire list of questions into the script file, and comment out the question itself.

1. How many words are there in all of Shakespeare's works?
1. The works in the OpenSourceShakespeare database are imported from other projects that provide public domain works in electronic format. Show the sources and number of works provided by each source.
1. Now show only the source providing the most works.
1. How many works did Shakespeare publish in each genre, and what is the earliest and latest publication year for each genre? Sort the results by genre code.
1. For each year, what is the average number of words in a comedy. Sort your results by year.
1. What is the `charid` and number of works the character appears in for all characters that appear in more than one work. Order the results from most to least works appeared in, then alphabetically by `charid`.
1. Excluding the Sonnets, what is the `workid` and chapter count of the works with more than 25 chapters? **NOTE**: Because the chapter (scene) numbering restarts for each section (act), you cannot rely on the chapter number (i.e., the value of the `chapter` field) to answer this question.
1. In what years did Shakespeare produce works in more than one genre?
