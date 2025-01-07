# Exercise: SQL INSERTs

Some scholars have suggested that the anonymous Elizabethan play *Edmund Ironside, or War Hath Made All Friends* was written by Shakespeare. Information about this play is available at <https://en.wikipedia.org/wiki/Edmund_Ironside_(play)>. A list of characters and the play text is available at <http://elizabethandrama.org/wp-content/uploads/2022/08/Edmond-Ironside-Script.pdf>.

You need to create `INSERT` statements to add this play and related information to the Shakespeare database. You should do this in your own local copy of the Shakespeare database. You do not need to add the play text, i.e. you will not add anything to the `paragraph` table. You will add entries to the `character`, `character_work`, and `work` tables.

Create one multiple-statement script with all of the inserts that you need.

1. Because of foreign key constraints, you must add rows to some tables before others. Using the Shakespeare ERD, determine the order of tables. You will not add any data to the `chapter` or `paragraph` tables, but do specify what order they should appear in the list. Include the answer to this question in a comment block at the top of your script.
2. You should make up a legal value for any field that *requires* an entry, such as `totalwords` (e.g., 100, or any other integer).
3. The `workid` should be "edmund". The year of publication 1587. Use the title above as the long title, and "Edmund Ironside" as the short title. The genre is history. The source is "ElizabethanDrama.org".
4. All characters listed in the script (Personae Dramatis) should be added. Words that appear after the comma are the descriptions. For example, the first character should have `charname` set to "Edmund Ironside", and the `description` set to "King of the Saxons, son of Ethelred the Unready". `charid` may be set to anything you want, but you will have to reenter it in the `character_work` table, so keep track of it. Following the convention for other plays in the Shakespeare database, `charid` should be composed of letters, numbers or the hypen (`-`). Don't use spaces.
5. Enter all characters in the link table `character_work`.

Submit one SQL script which can run from start to finish without error.

