PRAGMA foreign_keys = ON;

INSERT INTO categories (name) VALUES
 ('Fiction'), ('Science'), ('History'), ('Technology'), ('Biography');

INSERT INTO authors (first_name, last_name, country) VALUES
 ('Chinua', 'Achebe', 'Nigeria'),
 ('Ngugi', 'wa Thiong''o', 'Kenya'),
 ('Chimamanda', 'Adichie', 'Nigeria'),
 ('Yuval', 'Harari', 'Israel'),
 ('Carl', 'Sagan', 'USA'),
 ('Brian', 'Kernighan', 'Canada'),
 ('Dennis', 'Ritchie', 'USA'),
 ('Wangari', 'Maathai', 'Kenya'),
 ('Nelson', 'Mandela', 'South Africa'),
 ('Martin', 'Kleppmann', 'UK');

INSERT INTO books (title, isbn, published_year, copies_available, category_id) VALUES
 ('Things Fall Apart',                  '9780385474542', 1958, 3, 1),
 ('A Grain of Wheat',                   '9780143106890', 1967, 2, 1),
 ('Half of a Yellow Sun',               '9781400095209', 2006, 4, 1),
 ('Sapiens',                            '9780062316097', 2011, 5, 3),
 ('Cosmos',                             '9780345539434', 1980, 2, 2),
 ('The C Programming Language',         '9780131103627', 1978, 3, 4),
 ('Unbowed',                            '9780307275813', 2006, 2, 5),
 ('Long Walk to Freedom',               '9780316548182', 1994, 3, 5),
 ('Designing Data-Intensive Applications','9781449373320', 2017, 4, 4),
 ('The Pragmatic Origins of Unix',      '9780201799408', 1984, 1, 4);

-- Many-to-many (C book has two authors)
INSERT INTO book_authors (book_id, author_id) VALUES
 (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
 (6, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 7);

INSERT INTO members (full_name, email, joined_date) VALUES
 ('Amina Wanjiru',   'amina.wanjiru@example.com',   '2025-01-12'),
 ('Brian Otieno',    'brian.otieno@example.com',    '2025-03-05'),
 ('Fatuma Hassan',   'fatuma.hassan@example.com',   '2025-06-20'),
 ('David Kiprop',    'david.kiprop@example.com',    '2025-09-14'),
 ('Grace Mutua',     'grace.mutua@example.com',     '2026-02-01'),
 ('Samuel Njoroge',  'samuel.njoroge@example.com',  '2026-05-18');

INSERT INTO loans (book_id, member_id, loan_date, due_date, return_date) VALUES
 (1, 1, '2026-08-01', '2026-08-15', '2026-08-12'),
 (4, 1, '2026-09-10', '2026-09-24', '2026-09-30'),
 (6, 2, '2026-09-02', '2026-09-16', '2026-09-15'),
 (9, 2, '2026-10-01', '2026-10-15', NULL),
 (3, 3, '2026-09-20', '2026-10-04', NULL),
 (5, 3, '2026-07-11', '2026-07-25', '2026-07-24'),
 (7, 4, '2026-10-05', '2026-10-19', NULL),
 (8, 4, '2026-08-20', '2026-09-03', '2026-09-10'),
 (2, 5, '2026-09-28', '2026-10-12', NULL),
 (4, 5, '2026-06-15', '2026-06-29', '2026-06-28'),
 (1, 6, '2026-10-08', '2026-10-22', NULL),
 (9, 1, '2026-05-02', '2026-05-16', '2026-05-16');
