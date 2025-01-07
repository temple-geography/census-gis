# Exercise: SQL Joins


## Part 1 – Querying with table JOINs

This week's exercise will continue using the Shakespeare database. Now that you know how to do joins, assume that all answers should include the formal names of characters, plays, etc., not just the abbreviated names found in the keys.

Use table aliases to improve the readability of your queries. You can refer to the following ERD to understand relationships among the tables.

![](../images/shakespeare_erd.png)

1. What are the titles of all the plays with a scene that happens in a "churchyard"?
2. What are the character names, play titles and full text for any line where a character mentions the word "university".
3. Which plays have 60 or more characters? Give the play name and the number of characters; sort the results from most to least characters.
4. Some characters have no lines.
    1. Confirm that some characters have no lines by returning a list of the names of characters with a speech count of 0. (This is a single table query.)
    2. Return a list of names of characters that do not appear in the `paragraph` table (and therefore have no lines).
    3. Confirm that these two resultsets are the same.
5. List the character, act number (`section`) and number of lines (rows in `paragraph` table) for any character who has 30 lines or more in any single act of 12th Night. Do not include the character "(stage directions)" in your result. Sort the results by act then by number of lines.
6. You will notice that the `work` table contains columns for `totalwords` and `totalparagraphs`. But can't we derive those values from the entries in the `paragraph` table?
    1. Write a query which returns `title`, `totalwords`, and `totalparagraphs` columns from the `work` table and the same values calculated from the `paragraph` table using aggregate functions. **HINT:** This will require a `GROUP BY` clause.
    2. Eyeballing the resultset should suggest that the stored and calculated values are the same. Confirm that by writing a query which returns only those rows where the stored and calculated values are not equal, for either word count or paragraph count. **HINT:** This will require a `HAVING` clause.

## Part 2 – Entity-Relationship Diagrams

Create ERDs by hand for the following scenarios. Do not submit online. Bring to class to go over.

1. A university has many students and faculty members. The attributes of
    students are student ID, first name, last name and student address. A
    student can take zero, one or many classes. A class must have at least one
    student. Attributes of professors are professor ID, last name and first
    name. A professor teaches zero, one or many classes and a class is taught
    by one professor only. A course may have zero, one or many classes and a
    class comes from one course only. A class is held in one room but a room
    has many classes.

2. A company has a number of employees. The attributes of employees include
    employee ID, Name, address and birth date. The company also has several
    projects. Attributes of a project include project ID, project name and
    start date. Each employee may be assigned to one or more projects, or may
    not be assigned to a project. A project must have at least one employee
    assigned and may have any number of employees assigned. An employee's
    billing rate may vary by project and the company wishes to record the
    applicable billing rate for each employee when assigned to a particular
    project.


