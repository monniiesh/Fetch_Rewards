# Fetch Rewards Data Analysis Take Home

## INFO
NAME : Monniiesh Velmurugan
YEAR : Junior
MAJOR : Computer Science & Data Science

## Includes
1. ER Diagram
2. SQL queries

### ER Diagram Legend
1. thin lines : (0, inf) relation
2. thick lines : (1, inf) atleast in one relation
3. thick lines with a arrow : {1} exactly one relation
4. thin line with a arrow : (0, 1) atleast one relation
5. red underline : unique key / primary key
6. colored boxed on fields : keys which are used to join two tables (foreign keys which are color-coded)

### SQL Dialect
MySQL

### Data Analysis Tool
Python with Pandas and Matplotlib library

### Note-Worthy Analysis

The one main issue I noticed when starting to analyze the data is that, not all items in receipt_items 
have a brand in the brand table.

For example, there are lot of brand_codes name "GOLD MEDAL", but only one of their barcode (511111103653) has a corresponding value in the brands table.

If not all items are associated witha brand, it will be harder to predict the optimized way to make profit. (example, if we are aware of the brand of products which sells the most and scanned the most, we can create a optimal plan around it to create parnetship with those brands)

When you observe the data, food supplies are the products which are most sold, and topping the list is ready-to-eat food products (like canned foods) which are avaiable in aisle of any stores. So, creating partnership with food brands (especially read-to-consume foods such as canned food, drinks comnapy) can help boost the profit.
