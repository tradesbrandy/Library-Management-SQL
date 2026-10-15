-- Q1. INNER JOIN: each book with its category
SELECT b.title, c.name AS category, b.published_year
FROM books b
JOIN categories c ON c.category_id = b.category_id
ORDER BY c.name, b.title;

-- Q2. Many-to-many: books with all their authors (3 tables)
SELECT b.title,
       GROUP_CONCAT(a.first_name || ' ' || a.last_name, ', ') AS authors
FROM books b
JOIN book_authors ba ON ba.book_id = b.book_id
JOIN authors a       ON a.author_id = ba.author_id
GROUP BY b.book_id
ORDER BY b.title;

-- Q3. Who has borrowed what (4 tables)
SELECT m.full_name, b.title, c.name AS category, l.loan_date, l.return_date
FROM loans l
JOIN members m    ON m.member_id = l.member_id
JOIN books b      ON b.book_id = l.book_id
JOIN categories c ON c.category_id = b.category_id
ORDER BY l.loan_date;

-- Q4. LEFT JOIN: every member and how many loans they have (including zero)
SELECT m.full_name, COUNT(l.loan_id) AS total_loans
FROM members m
LEFT JOIN loans l ON l.member_id = m.member_id
GROUP BY m.member_id
ORDER BY total_loans DESC, m.full_name;

-- Q5. LEFT JOIN + IS NULL: books never borrowed
SELECT b.title
FROM books b
LEFT JOIN loans l ON l.book_id = b.book_id
WHERE l.loan_id IS NULL;

-- Q6. Currently overdue loans (not returned, due before today 2026-10-15)
SELECT m.full_name, m.email, b.title, l.due_date,
       CAST(julianday('2026-10-15') - julianday(l.due_date) AS INTEGER) AS days_overdue
FROM loans l
JOIN members m ON m.member_id = l.member_id
JOIN books b   ON b.book_id = l.book_id
WHERE l.return_date IS NULL AND l.due_date < '2026-10-15'
ORDER BY days_overdue DESC;

-- Q7. Most popular categories by number of loans
SELECT c.name AS category, COUNT(*) AS loans
FROM loans l
JOIN books b      ON b.book_id = l.book_id
JOIN categories c ON c.category_id = b.category_id
GROUP BY c.category_id
ORDER BY loans DESC;

-- Q8. Authors ranked by how often their books are borrowed
SELECT a.first_name || ' ' || a.last_name AS author, a.country, COUNT(l.loan_id) AS loans
FROM authors a
JOIN book_authors ba ON ba.author_id = a.author_id
LEFT JOIN loans l    ON l.book_id = ba.book_id
GROUP BY a.author_id
ORDER BY loans DESC, author;
