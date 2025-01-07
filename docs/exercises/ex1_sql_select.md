# Exercise: SQL SELECT Statements
 
These queries should be run against the Open Source Shakespeare database.

Each query should be run against a single table (i.e, no joins are necessary). You will not need to use the `wordform` or `character_work` table to answer any of these questions.

Your exercise should be submitted as one SQL script file. Use semicolons to terminate SQL statements. Use comments to indicate Question 1, Question 2, etc. You may also find it useful to copy the entire list of questions into the script file, and comment out the question itself.

1. Which work(s) of Shakespeare were written in 1604?
1. Return the entire text of the unique paragraphs that contain between 1 and 4 text characters inclusive (letters, numbers, punctuation, etc., in a text string). **HINT:** Use the `DISTINCT` keyword. Do *not* use the `GROUP BY` clause.
1. List the long title and year of work(s) from 1595, 1607 and 1609. Sort the results by year, then by title.
1. Show all the attributes for chapters with chapter number of 15.
1. List all the characters whose names have an "r" as the second position, end in either
an "o" or "a", do not start with an "F" or "G", and do not contain a space.
1. Which characters have a speech count greater than 250?
1. Often we can only half-remember a line from a poem or a play. A famous line from Shakespeare is "A rose by any other name would smell as sweet". But who says it in what play? The line is contained in one cell of the `plaintext` column in the `paragraph` table, but because of line breaks and capitalization differences, you cannot search for the string in its complete form. Construct a query that returns the name of the work (`workid`), character (`charid`), and number of words in the paragraph.
1. What is the title and year of Shakespeare's first work?
