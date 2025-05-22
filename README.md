# Wellington Transport Road-work

## Overview
* This project is for practical exposure to the stages involved in database development, including the development of entity relationship modelling, database design and implementation.
* The goal of this project is to create a database to store the details of roads([Full Case Study](https://github.com/NguyenThuan-data/Database_schoolPro_1/blob/master/COMP508%20S2%202024%20Case%20Study.pdf)). Including:
    - **Roads**
    - **Location**
    - **Projects**
    - **Contracts**
* Tools: **Oracle SQL Developer** and **Visual Paradigm CE**

## Academic Acknowledgment
This project was completed as part of the **COMP508 – Database System Design** course at Auckland University of Technology, during Semester 2, 2024.

## Files
`COMP508 S2 2024 Case Study.pdf` - Case study  
`WT database.sql` - SQL file  
`WT_ERD` - VPP file  

## Task 1: Identify Entities & Develop Business Rules
- Identify all entities and relationships in the case study and develop a set of **business rules**.
## Task 2: Construct a logical Entity Relationship Diagram (ERD)
- Based on the business rules developed in Task 1, construct a logical ERD for the case study using the
Visual Paradigm tool.
  - Identify all attributes in each entity, including all primary and foreign keys (transform any
composite and multivalued attributes according to the rules of the relational model).
  - Name all relationships (i.e. you must use verb phrases on both sides of each relationship)
  - Identify the Cardinality and Participation for each relationship.
  - Resolve all many-to-many (M:N) relationships.
  - Describe any assumptions you have made in a text note on the diagram
## Task 3: Create tables
- Create the tables in Oracle.1 Write SQL scripts defining each table. The table definitions should include
  - All attributes with appropriate data types
  - All appropriate constraints, such as primary key, foreign keys, and check statements (CHECK constraints).
  - All constraints must be given names. Naming standards must be used.
## Task 4: Populate data
- Insert a small sample of realistic test data (5 –10 rows minimum) into each table. All test data must be meaningful to demonstrate your understanding of the data.
- Run the SQL SELECT statement below:
  - SELECT table_name FROM user_tables;
## Task 5: Construct SQL Queries
- Use of restriction (WHERE clause), Arithmetic expressions, Concatenation of columns
- Use of comparison and logical operators
- Multiple tables join (e.g., Equijoin, Outer Join, and Self-join)
- Group functions (e.g., COUNT, SUM, AVG, MAX, MIN) and clauses (e.g., ORDER BY, GROUP
BY, HAVING)
