SELECT * FROM Customer_behavior


--1.Top 5 item categories by average purchase amount

SELECT TOP 5 category, AVG(purchase_amount) AS avg_amount
FROM customer_behavior
GROUP BY category
ORDER BY avg_amount DESC;


--2.Overall conversion rate of subscription

SELECT 
    (COUNT(CASE WHEN subscription_status = 'Yes' THEN 1 END) * 1.0) / COUNT(*) AS conversion_rate
FROM customer_behavior;


--3.Most popular payment method among 'Young Adult' age group

SELECT TOP 1 payment_method, COUNT(*) AS cnt
FROM customer_behavior
WHERE age_group = 'Young Adult'
GROUP BY payment_method
ORDER BY cnt DESC;


--4.Average review rating by item color

SELECT color, AVG(review_rating) AS avg_review
FROM customer_behavior
GROUP BY color;


--5.Compare purchase frequency between genders

SELECT gender, AVG(purchase_frequency_days) AS avg_frequency
FROM customer_behavior
GROUP BY gender;


--6.Distribution of shipping types in the 'Winter' season

SELECT shipping_type, COUNT(*) AS cnt
FROM customer_behavior
WHERE season = 'Winter'
GROUP BY shipping_type
ORDER BY cnt DESC;


--7.Location with the highest average discount applied

SELECT TOP 1 location, 
       AVG(CASE WHEN discount_applied = 'Yes' THEN 1.0 ELSE 0 END)*100 AS avg_discount
FROM customer_behavior
GROUP BY location
ORDER BY avg_discount DESC;


--8.Most frequently purchased item during 'Spring' by adults

SELECT TOP 1 item_purchased, COUNT(*) AS cnt
FROM customer_behavior
WHERE season = 'Spring' AND age_group = 'Adult'
GROUP BY item_purchased
ORDER BY cnt DESC;


--9.Subscription opt-in trend by age group

SELECT age_group,
       COUNT(CASE WHEN subscription_status = 'Yes' THEN 1 END) AS subscribed,
       COUNT(*) AS total,
       (COUNT(CASE WHEN subscription_status = 'Yes' THEN 1 END) * 1.0) / COUNT(*)*100 AS subscription_rate
FROM customer_behavior
GROUP BY age_group
ORDER BY subscription_rate DESC;


--10.Top 3 states where 'Footwear' is purchased most

SELECT TOP 3 location, COUNT(*) AS cnt
FROM customer_behavior
WHERE category = 'Footwear'
GROUP BY location
ORDER BY cnt DESC;


--11.Subscription rate by shipping type

SELECT shipping_type, 
       (COUNT(CASE WHEN subscription_status = 'Yes' THEN 1 END) * 1.0) / COUNT(*)*100 AS sub_rate
FROM customer_behavior
GROUP BY shipping_type;


--12.Purchase amount range for 'Clothing' by size

SELECT size, MIN(purchase_amount) AS min_amt, MAX(purchase_amount) AS max_amt, AVG(purchase_amount) AS avg_amt
FROM customer_behavior
WHERE category = 'Clothing'
GROUP BY size;


--13.Seasonal trends in review ratings for 'Accessories'

SELECT season, AVG(review_rating) AS avg_review
FROM customer_behavior
WHERE category = 'Accessories'
GROUP BY season
ORDER BY season;


--14.Impact of discount application on average purchase amount

SELECT discount_applied, AVG(purchase_amount) AS avg_amt
FROM customer_behavior
GROUP BY discount_applied;


--15.Maximum previous purchases by payment method

SELECT payment_method, MAX(previous_purchases) AS max_prev
FROM customer_behavior
GROUP BY payment_method;


--16.Top-rated items by color

SELECT color, item_purchased, MAX(review_rating) AS max_review
FROM customer_behavior
GROUP BY color, item_purchased
ORDER BY max_review DESC;


--17.Purchases with 'Next Day Air' shipping and discount applied

SELECT COUNT(*) AS cnt
FROM customer_behavior
WHERE shipping_type = 'Next Day Air' AND discount_applied = 'Yes';


--18.Average purchase amount by age group and season

SELECT age_group, season, AVG(purchase_amount) AS avg_amt
FROM customer_behavior
GROUP BY age_group, season
ORDER BY avg_amt DESC;

--19.Customer retention rate (based on repeat purchases)

SELECT 
    (COUNT(DISTINCT CASE WHEN previous_purchases > 0 THEN customer_id END) * 1.0)*100
    / COUNT(DISTINCT customer_id) AS retention_rate
FROM customer_behavior;

--20.Correlation check: Do discounts improve review ratings?

SELECT discount_applied, AVG(review_rating) AS avg_rating
FROM customer_behavior
GROUP BY discount_applied;