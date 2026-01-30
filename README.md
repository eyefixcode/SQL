<h1>SQL Order of Operations — Reference Guide</h1>

<hr>

<h2>Purpose</h2>

<p>
This document serves as a concise reference for core SQL components, logical execution order,
and commonly used query patterns.
</p>

<p>
It is intended for learning, review, and day-to-day query design across analytical and production environments.
</p>

---

<h2>Logical Order of Operations</h2>

<p>
Although SQL queries are written in a specific syntax order, they are evaluated by the database
engine in the following logical sequence:
</p>

<ol>
    <li><strong>FROM</strong></li>
    <li><strong>JOIN</strong></li>
    <li><strong>ON</strong></li>
    <li><strong>WHERE</strong></li>
    <li><strong>GROUP BY</strong></li>
    <li><strong>HAVING</strong></li>
    <li><strong>SELECT</strong></li>
    <li><strong>ORDER BY</strong></li>
</ol>

---

<h2>JOINs & Set Operations</h2>

<h3>INNER JOIN</h3>
<p>Returns rows with matches in both tables.</p>

<pre><code>
SELECT *
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;
</code></pre>

<h3>LEFT (OUTER) JOIN</h3>
<p>Returns all rows from the left table and matching rows from the right.</p>

<pre><code>
SELECT *
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
</code></pre>

<h3>RIGHT (OUTER) JOIN</h3>
<p>Returns all rows from the right table and matching rows from the left.</p>
<pre><code>
SELECT *
FROM orders o
RIGHT JOIN customers c
    ON o.customer_id = c.customer_id;
</code></pre>

<h3>FULL (OUTER) JOIN</h3>
<p>Returns all rows from both tables, matching where possible.</p>
<pre><code>
SELECT *
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id;
</code></pre>

<h3>CROSS JOIN</h3>
<p>Returns the Cartesian product of both tables.</p>
<pre><code>
SELECT *
FROM products
CROSS JOIN regions;
</code></pre>

<h3>SELF JOIN</h3>
<p>Joins a table to itself using aliases.</p>

<pre><code>
SELECT e.name, m.name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;
</code></pre>

---

<h2>UNION & UNION ALL</h2>

<p>
UNIONs combine the results of multiple SELECT statements.
</p>

<h3>UNION</h3>
<p>Removes duplicate rows.</p>

<pre><code>
SELECT email FROM customers
UNION
SELECT email FROM leads;
</code></pre>

<h3>UNION ALL</h3>
<p>Preserves duplicates.</p>

<pre><code>
SELECT email FROM customers
UNION ALL
SELECT email FROM leads;
</code></pre>

---

<h2>Aliases</h2>

<p>
Aliases improve readability and are required in some cases (e.g., self-joins).
</p>

<pre><code>
SELECT
    c.customer_name,
    o.order_date
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id;
</code></pre>

---

<h2>Subqueries</h2>

<p>
Subqueries are queries nested inside another query. They can appear in SELECT, FROM, or WHERE clauses.
</p>

<h3>Subquery in WHERE</h3>

<pre><code>
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE active = 1
);
</code></pre>

<h3>Subquery in FROM</h3>

<pre><code>
SELECT avg_order_value
FROM (
    SELECT AVG(total) AS avg_order_value
    FROM orders
) t;
</code></pre>

---

<h2>Common Table Expressions (CTEs)</h2>

<p>
CTEs improve readability and are often preferred over deeply nested subqueries.
</p>

<pre><code>
WITH active_customers AS (
    SELECT customer_id
    FROM customers
    WHERE active = 1
)
SELECT *
FROM orders
WHERE customer_id IN (SELECT customer_id FROM active_customers);
</code></pre>

---

<h2>Stored Procedures</h2>

<p>
Stored procedures encapsulate reusable logic that can accept parameters and execute multiple statements.
</p>

<pre><code>
CREATE PROCEDURE GetCustomerOrders
    @CustomerID INT
AS
BEGIN
    SELECT *
    FROM orders
    WHERE customer_id = @CustomerID;
END;
</code></pre>

---

<h2>Aggregation</h2>

<h3>GROUP BY</h3>
<p>Groups rows for aggregate calculations.</p>

<h3>HAVING</h3>
<p>Filters aggregated results.</p>

<pre><code>
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;
</code></pre>

---

<h2>Example Query</h2>

<pre><code>
SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.active = 1
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;
</code></pre>

---

<h2>Notes & Best Practices</h2>

<ul>
    <li>JOIN conditions belong in <code>ON</code>; filters belong in <code>WHERE</code>.</li>
    <li>Filtering on the right table of a LEFT JOIN in <code>WHERE</code> can change results.</li>
    <li>Use CTEs for clarity when queries become complex.</li>
    <li>Prefer UNION ALL when duplicates are acceptable for performance.</li>
</ul>

---

<h2>Closing</h2>

<p>
This guide is intended as a practical SQL reference covering core components and execution behavior.
It can be used for learning, review, and explaining query logic clearly and consistently.
</p>

<p>
<strong>James Settles</strong><br>
Health Informatics & Data Analytics<br>
<a href="https://www.linkedin.com/in/james-settles/" target="_blank">LinkedIn</a>
</p>
