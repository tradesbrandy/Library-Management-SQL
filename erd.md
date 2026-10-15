# Library Management System: ERD

```mermaid
erDiagram
    AUTHORS ||--o{ BOOK_AUTHORS : writes
    BOOKS ||--o{ BOOK_AUTHORS : "written by"
    CATEGORIES ||--o{ BOOKS : classifies
    BOOKS ||--o{ LOANS : "borrowed in"
    MEMBERS ||--o{ LOANS : makes

    AUTHORS {
        int author_id PK
        text first_name
        text last_name
        text country
    }
    CATEGORIES {
        int category_id PK
        text name UK
    }
    BOOKS {
        int book_id PK
        text title
        text isbn UK
        int published_year
        int copies_available
        int category_id FK
    }
    BOOK_AUTHORS {
        int book_id PK,FK
        int author_id PK,FK
    }
    MEMBERS {
        int member_id PK
        text full_name
        text email UK
        text joined_date
    }
    LOANS {
        int loan_id PK
        int book_id FK
        int member_id FK
        text loan_date
        text due_date
        text return_date
    }
```

## Relationships
- A category has many books; each book belongs to one category (1:N).
- Books and authors are many-to-many, resolved by `book_authors`.
- A member can have many loans; a book can appear in many loans (1:N each).
- `return_date` is NULL while a loan is still open.
