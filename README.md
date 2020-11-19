**# Case Study: Clasification**



**## Content**

\- [Project Description](#project-description)

\- [Objective](#Objective)

\- [Data](#data)

\- [Method](#method)

\- [Modelling and Results](#modelling-results)

\- [Conclusions](#conclusions)

\- [Notebooks](#notebooks)

\- [Dataset](#dataset)

\- [Sources](#sources)



**## Project Description**

You are working as a risk analyst with a bank. Apart from the other banking and loan services, the bank also provides credit card services that are a very important source of revenue for the bank. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.



Usually, the observational data for these kinds of problems is somewhat limited in that often the company sees only those who respond to an offer. To get around this, the bank designs a focused marketing study, with 18,000 current bank customers. This focused approach allows the bank to know who does and does not respond to the offer, and to use existing demographic data that is already available on each customer.



**## Objective**

Build a model that will provide insight into why some bank customers accept credit card offers. There are also other potential areas of opportunities that the bank wants to understand from the data.

Your senior management has also posted these other questions that will help them better understand their customers.



**## Data**

The data set consists of information on 18,000 current bank customers in the study. These are the definitions of data points provided:



Customer Number: A sequential number assigned to the customers (this column is hidden and excluded – this unique identifier will not be used directly).

Offer Accepted: Did the customer accept (Yes) or reject (No) the offer. Reward: The type of reward program offered for the card.

Mailer Type: Letter or postcard.

Income Level: Low, Medium, or High.

Bank Accounts Open: How many non-credit-card accounts are held by the customer.

Overdraft Protection: Does the customer have overdraft protection on their checking account(s) (Yes or No).

Credit Rating: Low, Medium, or High.

Credit Cards Held: The number of credit cards held at the bank.

Homes Owned: The number of homes owned by the customer.

Household Size: The number of individuals in the family.

Own Your Home: Does the customer own their home? (Yes or No).

Average Balance: Average account balance (across all accounts over time). Q1, Q2, Q3, and Q4

Balance: The average balance for each quarter in the last year



**### Data pre-processing**



During the data pre-processing, the possible multicollinearity between all of data features. We checked for multicollinearity between features by computing the Pearson's correlation coefficients in a correlation matrix. In general, correlation coefficients of >0.7 indicates the presence of multicollinearity, which leads to model overfitting and in turns to higher modeling computational cost and possibly lower model performance. We could deduce that:

\- there was a strong correlation between average balance and q2 balance. 

\- there was also a strong correlation between average balance and q3 balance.