--Problem 1
SELECT email FROM customers ORDER BY email ASC;
--Problem 2
SELECT id
FROM orders
WHERE customer_id IN (
    SELECT id
    FROM customers
    WHERE id = 1
);
--Problem 3
SELECT SUM(num_cupcakes) AS sum FROM orders WHERE processed = false;
--Problem 4
-- coalesce handles cupcakes with no orders, returns 0 if nothing matches
SELECT c.name AS name, 
COALESCE(SUM(o.num_cupcakes), 0) AS sum
FROM cupcakes AS c
LEFT JOIN orders AS o ON c.id = o.cupcake_id
GROUP BY c.name
ORDER BY c.name ASC;
--Problem 5
SELECT c.email AS email,
COALESCE(SUM(o.num_cupcakes), 0) AS total
FROM customers AS c
LEFT JOIN orders AS o ON c.id = o.customer_id
GROUP BY c.email
ORDER BY total DESC;
--Problem 6
SELECT fname, lname, email
FROM customers
WHERE id IN (
   SELECT customer_id
    FROM orders
    WHERE processed is TRUE
    AND cupcake_id = (
            SELECT id 
            FROM cupcakes
            WHERE name = 'funfetti'
)
);
--PART 2
--Step 1


