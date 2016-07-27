% Mapping Commuting Flows Among Philadelphia MSA Counties
% Prof. Hachadoorian
% Summer II 2016

# Overview

# Data

## Getting the Commuting Flow Data

We are going to begin by downloading CTPP (Census Transportation Planning Package) data from the AASHTO website. Go to [http://ctpp.transportation.org/Pages/5-Year-Data.aspx](http://ctpp.transportation.org/Pages/5-Year-Data.aspx). The data selection tool is fairly complex, and will be easiest to understand if you see it in action. Therefore, begin by watching the following YouTube videos (or click the "take me to the movies" button to see these and other tutorial videos):

* [CTPP Software: select geography by list and map](https://www.youtube.com/watch?v=3up9mF6gEL0)
* [CTPP Software: open and rearrange a data table](https://www.youtube.com/watch?v=ly-KjIZgE8I)

After you review how to create and download a table, click the "take me to the data" button.

While you do not have, you may choose to click the Sign In link on the upper right and register for an account. This will allow y ou to save your data selections. Unlike with NHGIS, registering is not required. However, the data selection tool is somewhat clunky, so it may be useful to save your selections.

We will be downloading a table of county-to-county commuting flows within the Philadelpha-Camden-Wilmington MSA. In order to do so, we need to make three selections: Residence Geogrpahy, Workplace Geography, and the data table we are interested in. Here is a list of the counties in the MSA:

* Delaware
    * New Castle County (FIPS 10003)
* Maryland
    * Cecil County (FIPS 24015)
* New Jersey
    * Burlington County (FIPS 34005)
    * Camden County (FIPS 34007)
    * Gloucester County (FIPS 34015)
    * Salem County (FIPS 34033)
* Pennsylvania
    * Bucks County (FIPS 42017)
    * Chester County (FIPS 42029)
    * Delaware County (FIPS 42045)
    * Montgomery County (FIPS 42091)
    * Philadelphia County (FIPS 42101)

Begin by clicking the RESIDENCE link at the top of the page. The application defaults to showing selection by state with all states selected.

1. In the Select level (left-hand) pane, click the "Clear full selection" button.
2. Click State-County (which, since you have just cleared the selection, should say 0 of 3,221 selected).
3. Select the counties in the Philadlephia MSA.
    a. In the right-hand pane, you will see a list of counties to select. You can scroll through the list to select the counties of interest. However, it will be easier to use the filter to narrow down the list. Begin by searching on "Pennsylvania", and then select Bucks, Chester, Delaware, Montgomery, and Philadelphia county.
    b. Continue to select the appropriate counties in New Jersey, Delaware, and Maryland. Since Delaware and Maryland each have one county that you will select, you can search on that county name directly.
4. After you are done, click on the button for "Show selected" (hover to find the correct one) to confirm that you have selected all of the desired counties.
5. If you are registered and logged in, you can click the "Save selection set" button on the upper left to save this selection of 11 counties. After you do so, the name that you assign will appear in the Residence dropdown up above.

After selecting the residence counties, click the WORKPLACE link to select the workplace geography. Follow the same steps as you did for residence. You will not the that geographies are named "POW State", "POW County", etc., which stands for "Place of Work…" However, everything else about the process should be the same.

After selecting both Residence and Workplace geographies, click the Show CTPP Tables button on the upper right. You have the following choices:

* CTPP 5-Year Data Set (2006 to 2010): Based on ACS 2006-2010, this is a highly detailed data set that includes demographic data about workers by place of residence, place of work, and flows between them.
* Commuting Flows - ACS 2009-2013: As the name implies, this is more recent, but only includes commuting flows (no demographic data or data about industries or occupations) at the state and county level.

For this exercise we will use the more recent commuting flow data, but do keep in mind that there is much more highly detailed data about commuting times, departure times, industries, poverty status, etc, in the CTPP 2006 to 2010 data. 

Expand the Commuting Flows - ACS 2009-2013 branch, then click Table 1. Since our Residence and Workplace geographies are already selected, you should immediately see a result table.

In order to use this data to create a flow map in QGIS, we need the data as a matrix. That is, instead of having it listed as:

+---+---+---+
| A | A | 1 |
+---+---+---+
| A | B | 2 |
+---+---+---+
| A | C | 3 |
+---+---+---+
| B | A | 4 |
+---+---+---+
| B | B | 5 |
+---+---+---+
| B | C | 6 |
+---+---+---+
| C | A | 7 |
+---+---+---+
| C | B | 8 |
+---+---+---+
| C | C | 9 |
+---+---+---+

it needs to be in this format:

+---+---+---+---+
|   | A | B | C |
+---+---+---+---+
| A | 1 | 2 | 3 |
+---+---+---+---+
| B | 4 | 5 | 6 |
+---+---+---+---+
| C | 7 | 8 | 9 |
+---+---+---+---+

Therefore, grab the WORKPLACE column by its header, drag it and drop it on the Output tray. In order to make sure your result *only* displays the Estimate, not the Margin of Error, drag Output to the gray box that says "Drag dimensions here so they do not show as a row or column in table". You can then control whether the output cells display the Estimate or Margin of Error by selecting from the dropdown in the Output tray.

Click the Download button at the top. Set:

* Download format: "Comma-delimited ASCII format (*.csv)"
* Data format: "Multi-dimensional"

Save the CSV to your work folder.

## Formatting the data for FlowMapper.

The QGIS FlowMapper plugin requires the files in the following formats:

* A coordinates file, with points that indicate where the flow lines will be drawn from and to. We will use county centroids.
* The flows matrix, which you just downloaded, though we will have to clean it up.
* An optional names file, with the names of the geographies (county names in this case).

The coordinates file can be downloaded from <https://github.com/temple-geography/census-gis/blob/master/Coordinates.txt>.

<!--NOTE: Check coordinates file to make sure order matches that of Flows.txt and Names.txt-->

<!--NOTE: Update instructions to have students create coordinates file themselves-->

### Creating the Name File

Open the file you downloaded in Excel. Copy the column of Residence names.

Open Notepad++. Paste the column of names. You should have one name per line.

Save it with the name `Names.txt`.

>TIP: Make sure your file contains no blank lines at the end.

### Creating the Flows File

Switch back to Excel. Delete *all* Titles, headers, columns names, row names, and footnotes. The only thing left should be a 11x11 matrix of numbers. Fill in any blanks with 0. Now use Save As to save the file with a new name and format. Choose the "Text (Tab delimited)" format. Name the file `Matrix.txt`.

>TIP: Make sure your file contains no blank lines at the end.

Excel will give you an extremely annoying dialog asking whether you are sure that you want to save the file in this format. Click Yes. Then close the file. Even though you have not made any additional changes since saving the file, when you close it, Excel will prompt you to save changes. Excel does this *even though you have already saved it* since you did not save it to Excel's native format. This is a little counterintuitive, but click Don't Save and exit Excel.

# Creating Flow Lines

1. Open up QGIS
2. Go to Plugins→FlowMapper→Generate flow lines and nodes^[If this plugin is not available, you can add it by going to Plugins→Manage and Install Plugins and searching for it there. Please ask the instructor for help if you have trouble with this step.]
3. A dialogue box will appear. If you are using Mac, some of the headings will be cut off.
4. In the first Browse line, select your `Coordinates.txt` file. Check the "include node names in output" box. In the second Browse line, select `Names.txt`. In the third Browse line, select `Matrix.txt`. Select your flow type as "Two Way". In the fourth Browse line, choose a name to save the shapefile. Click OK.
5. Since the coordinates lack spatial referencing, you be presented with a dialog to choose the coordinate reference system. You must choose the CRS appropriate to your coordinates text file, which in this case is EPSG:2272, Pennsylvania State Plane South.


# Adjusting data by classification, magnitude, and hue

1. The two principle ways to represent flow lines are by varying
widths and hues. To represent by widths:
    a. click layer→Properties→Style→Advanced→Size scale field→Magnitude→OK
2. As you will see, some of the values are so large that they take over
the entire map. You will therefore need to make the width of your
base line much smaller.
    a. Click layer→Properties→Style→Width→1.00000→.1
3. This however, makes some lines infinitesimally small. Thus,
classifying by hue would be a better option. To do this:
    a. Click layer→Properties→Style→Advanced→Size scale field→no field
    b. Single symbol→Graduated symbol→Color ramp→YlOrRd
4. This is better. But not a great variety of colors are being shown. By
changing the classification from Equal Intervals to Natural Breaks,
a wider scale of colors will be seen.
    a. Properties→Style→Mode→Natural Breaks (Jenks)
5. That was an improvement. However, adding varying widths to the
lines would help differentiate the magnitude of the remittance
flows. To change the widths:
    a. Click layer→Properties→Style. Double click 1st classification. Click Simple Line. Change pen width to .5 millimeters
    b. Repeat this step for each subsequent classification, increasing
pen width by .5 additional millimeter each time (1, 1.5, etc.)
6. If for any reason you wanted to change your classification again,
unfortunately the pen widths you just created would be lost. To
avoid this in the future, of note is that you can define parameters in
the "rule-based" symbology tab as well.

## ASSIGNMENT

Turn in your map of flow lines overlaying the Philadelphia MSA counties. Make sure to choose colors that work well together, i.e., if some of your flow lines are yellow, it would be best not to use yellow for the county color. Use the Layer Properties dialog to label the counties. Make sure to include a legend of the flow lines. Do not include a legend for the counties.

BONUS: Download some additional data for the county to make a choropleth map of the county layer. Make sure to choose a color ramp that works well with the flow lines. In this case *do* include a legend for the county choropleth.

