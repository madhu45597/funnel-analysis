# Funnel Drop-off Analysis (SQL)

## Project Overview
This project analyzes user behavior in a website signup and checkout funnel using SQL. The objective is to calculate user conversion at each stage and identify where the largest user drop-off occurs.

## Dataset
The dataset contains:
- user_id
- step
- event_time

Funnel stages:
1. Visited Site
2. Signup Started
3. Details Filled
4. Email Verified
5. Purchase Completed

## Objectives
- Count unique users at each funnel stage
- Calculate stage-to-stage conversion rates
- Identify the biggest drop-off stage
- Provide business recommendations

## SQL Concepts Used
- SELECT
- COUNT(DISTINCT)
- GROUP BY
- CASE
- Common Table Expressions (CTEs)
- Window Function (LAG)
- ORDER BY

## Key Finding
The biggest drop-off occurs between **Details Filled** and **Email Verified**, where the conversion rate is **54.17%**.

## Recommendation
Simplify the email verification process, reduce friction, and improve verification email delivery to increase user conversion.
