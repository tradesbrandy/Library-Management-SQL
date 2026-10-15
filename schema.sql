PRAGMA foreign_keys = ON;

CREATE TABLE authors (
    author_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name  TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    country     TEXT
);

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id          INTEGER PRIMARY KEY AUTOINCREMENT,
    title            TEXT NOT NULL,
    isbn             TEXT NOT NULL UNIQUE,
    published_year   INTEGER CHECK (published_year BETWEEN 1400 AND 2100),
    copies_available INTEGER NOT NULL DEFAULT 1 CHECK (copies_available >= 0),
    category_id      INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE book_authors (
    book_id   INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id)   REFERENCES books(book_id)     ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

CREATE TABLE members (
    member_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name   TEXT NOT NULL,
    email       TEXT NOT NULL UNIQUE,
    joined_date TEXT NOT NULL
);

CREATE TABLE loans (
    loan_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id     INTEGER NOT NULL,
    member_id   INTEGER NOT NULL,
    loan_date   TEXT NOT NULL,
    due_date    TEXT NOT NULL,
    return_date TEXT,
    CHECK (due_date >= loan_date),
    FOREIGN KEY (book_id)   REFERENCES books(book_id)     ON DELETE RESTRICT,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE RESTRICT
);

CREATE INDEX idx_books_category ON books(category_id);
CREATE INDEX idx_loans_book     ON loans(book_id);
CREATE INDEX idx_loans_member   ON loans(member_id);
