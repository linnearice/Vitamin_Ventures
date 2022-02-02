# Vitamin_Ventures
---

## Final Project

Please visit the link to see
[analysis webpage](https://hotmochanowhip.github.io/Vitamin_Ventures/)

IT IS IMPORTANT TO NOTE THIS PROJECT IS GEARED TO MIMIC WHAT YOU MIGHT BE ASKED TO DO IN AN INTRO LEVEL ANALYST ROLE. THE DATA AND PROJECT MIGHT NOT SEEM SPETACULAR AT FIRST GLANCE, BUT IT BREATHES INSIGHT INTO WHERE THIS COMPANY CAN PIVOT THEIR SALES STRATEGIES.

---

**Tech Stack:**
* Excel (Data cleaning and masking per company guidelines and disclosure agreements - all product identities are masked/encoded) 
* pgAdmin / PostgreSQL (Data Exploration and Table creation for new visualizaitons)
* Matplotlib (Linear Regression)
* Plotly (integrated web visualizations)
* HTML / CSS (web format through repo.io)

---

## Quick Overview

We were given real company data from a new and relatively small staffed vitamin sales business that does not have any analysis projects done. In order to use this for our final project to explore and do a full data analysis on two years of sales data, we were in agreement that the company, data, and some sales info would be masked to conceal the identity of the company. 

One of our team mates who got approval and provided the cleaning/masking of our data will be able to take our findings back to the company and deliver real results with the master list for 1:1 maskings done. 

Below is some step-by-step instructions on how we cleaned the data, masked the data, created our file structure, added interactive graphs, created a html shell for our project, and put everything together in an orderly manner.

---

## Getting the data (ETL)

The data was provided by Jillian after cleaning their sales extractions in Excel. They used vlookup to mask the data. It was then provided to us in 3 CSV files. One with product details, one comprised of all web sales data, and another that was comprised of all sales data on the company side organized by sales channels.

While some of the channel and product names might seem vauge, they are real product and real e-commerce and retail business that sell their products. 

After the ETL process, we created derived tables using pgAdmin and postgreSQL([See SQL directory](https://github.com/HotMochaNoWhip/Vitamin_Ventures/tree/main/SQL)). This was the first step in exploring the data and deciding how to separate it for some cleaner tables to make some detailed questions on what we would like to see for analysis. [Raw data directory](https://github.com/HotMochaNoWhip/Vitamin_Ventures/tree/main/Data/Raw_Data). [Derived table directory](https://github.com/HotMochaNoWhip/Vitamin_Ventures/tree/main/Data/Derived_Tables)

## Exploring the data

See [issue 11](https://github.com/HotMochaNoWhip/Vitamin_Ventures/issues/11), [issue 12](https://github.com/HotMochaNoWhip/Vitamin_Ventures/issues/12), and [issue 13](https://github.com/HotMochaNoWhip/Vitamin_Ventures/issues/13) for questions we wanted to get from our derived tables. 

In our exploration to tackle these issues, and start to creating the jupyter notebook files ([See IPYNB directory](https://github.com/HotMochaNoWhip/Vitamin_Ventures/tree/main/IPYNB)), additional queries and CSV's were created. These CSV files ([See Data directory](https://github.com/HotMochaNoWhip/Vitamin_Ventures/tree/main/Data)) allowed for quicker and easier creation of ploty tables. 

After creating multiple different ploty graphs ([See Graphs directory](https://github.com/HotMochaNoWhip/Vitamin_Ventures/tree/main/Graphs)), we were able to deduce some hyptohesis on where data trends were heading and where to stear our questions and additional graphs/aggregations for conclusive statements.

## Organizing the data and creating html for the analysis

We structured our HTML to house the pltoly graphs based on categories. The categories are as follows:

- Channel data
- Web sales in the US
- International web sales

Any plotly graphs that pertained to each category were then extracted in HTML format and loaded into the created HTML shell as they were being created. While more graphs were being pumped out, we would analyze each graph to answer issue questions. 

Eventually we decided which ones to keep that had the most significance to our write and recommendations for the company moving forward. 

## Companies Category Overview's and Summaries

Each page has a breakdown of our findings and recomendations for the companies straegy in 2022. This was the combined efforts of our entire team with only being provided 3 CSV files. Please view the webpage and explore our hard work to help a company grow even stronger moving through 2022! 

---
---
# About the collaborators

The effort was immense for many of our team members and we each learned many new skills/ways to tackle problems in the process. Here we will talk about each person and their collaborations to the project.

---

## Linnea Rice

* Data Prep and Cleaning - Helped team member Jillian Jagoda prepare company data for our team to begin analysis. Data had to be masked to conceal certain private company information and vendors. We created a new product key with new product sku numbers and new product title names. Jillian had to map the company's real skus to the newly created ones. We needed to mimic product families or groupings so our data would have some resemblence for analysis purposes. There was a little more to this exercise than originally anticipated but it worked out and we were able to	collect 2 years	of sales and product data by distribution channel as well as sales and product data by location.
	
* Data Analysis - Wrote query code in SQL to create 25+ SQL tables of data. These tables were exported to cvs files and pulled into Python for further summary analysis and developing Plotly charts.  Responsible for drafting the first two rounds of data analysis. Developed summary data for sales by channel and by product and by USA and International countries. Upon review it would have been a more seamless process to do more of the summary analysis in Python avoiding the creation of so many SQL tables which had to be exported for the end result analysis.

* Charting and Graphing - Holly Carter and I together were responsible for creating all of the charts and graphs for the project. Holly created probably more than 50 graphs for the project. I created the USA bubble chart and Global Presence maps plus others. These maps were fun to do but longtitude and latitude were needed to create them. After some digging, I found the data on git (https://gist.github.com/erichurst/7882666).

---

## Zarina Kossakova

This project gave me the opportunity to apply my knowledge of many subjects I have learned in this class such as SQL, CSV, Python, Plotly, Pandas Library, Git, HTML and CSS.

- Data Prep and Cleaning – Starting off with 3 CSV files, we worked with Morgan Peterson and Linnea Rice on creating a database in pgAdmin and writing query codes in SQL tables. Using CSV files created with SQL tables applied knowledge of Python and Pandas Library using Jupiter Notebook.

- Visualization – Applying interactive open-source Plotly and Plotly Express libraries, I updated and transformed various types of graphs for the best interactive webpage presentation.

- HTML– In this project I was fully responsible for creating the interactive webpage. Using the latest version on of HTML5 I designed multiple interactive pages applying the CSS style sheet language. My tasks were to showcase our analysis discovery and findings in a straightforward interactive webpage, and to create discrete pages that cover each topic’s analysis.

I am extremely proud of all the hard work that we did as a team, I enjoyed working with each and everyone. 

---

## Morgan Peterson

I am very proud of my team. Those who worked on code tirelessy to learn more and push themselves to new levels made this project a great success. With Covid affecting multiple members on the team during our project, myself being drafted into a sev1 incident at work that required a bit of time away from the project (very thankful, this class helped me get the job in the first place), and others having life issues cause delays, we stuck it through together and made something I am very proud to present.

- GitHub and Project management - I was tasked with taking the lead role for our project. We used my github repo to house our project. Collaborator access, repository structuring, issue creation, Kanban project board, and branch management were my main point of focus. I made sure that no files were overwritten, everyone had an assigned task for parts of the project they wanted to cover, and that the education was provided for anyone that wanted to learn more about github/terminal commands.

- Database management and SQL - At the start I held an instructive and in depth tutor session on how to upload our data into a database and then create derived tables that could be used to create qeustions and visualizations from. The tutor session consisted mostly of me teaching my team how to preform advanced queries with functions that we did not learn in class.

- Approving PR's - When we would create pull request for merging branchs I would spot check and make sure 2 people approved the request. There were a few times when I overrided the 2 rule due to our bandwidth and time but everyone got to learn about the process at one point or another. I would also check added code for any typos, errors, or potential merge errors that could occur. 

--- 

## Holly Carter

- HTML: Researched/provided HTML code snippet to embed interactive Plotly graphs saved as HTML files on static webpage.

- Charting/Graphing: Linnea Rice and I created visualizations for the project. I used Python to clean and analyze the data from the refined .csv tables Morgan Peterson created. Interactive Plotly graphs were created with code writing each graph to an individual .html file.

- Linear Regression: Estimated median household income by ZIP Code was obtained from data available at census.gov/data. United States web-based sales data for 2020 and 2021 was provided by Vitamin Ventures.  Data cleaning, analysis and regression was performed using Python and plotted sing Matplotlib.

---

## Jillian Jagoda

Data Prep and Compilation:

- I was able to ask my boss for permission to use our company data. He required that all data be masked before I present it to my team members. I used a vlookup in excel to mask all products, customers, and dates. Additionally, I changed all revenue numbers to ensure privacy.

- Challenge: The data cleanup process was very time consuming. Within the data, there was not always one product name that was consistent for each line item so I had to go through the data and figure out where there were 
duplicates of the same item under a different product sku. I ended up creating my own numbering system to ensure the data was consistent for the vlookup and the mapping to work correctly. Additionally, there were a lot of blank items, so If it made sense, then I would delete the data, or I would add an appropriate sku. Linea helped me clean the data even more within SQL. She also helped me think of product names for the fictitious company.

Analyzing and Visualizing the Data:

- I created a guideline of how the products should be analyzed within excel. I created several different pivot charts to quickly draft out 10 different charts 
that needed to be created using coding. Once the final graphs and charts were created by Holly and Linea, I summarized the key findings within each graph. Additionally, after discussing with our group members, I wrote out our final recommendations for Vitamin Ventures.