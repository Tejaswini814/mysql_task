USE cdg_hyd_jfs_058;
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    isbn CHAR(13) NOT NULL,
    title VARCHAR(200) NOT NULL,
    author_name VARCHAR(120) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    publisher VARCHAR(120),
    publication_year SMALLINT NOT NULL,
    page_count INT NOT NULL,
    book_format VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    copies_available INT NOT NULL,
    language VARCHAR(40) NOT NULL DEFAULT 'English',
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_book_id PRIMARY KEY (book_id),
    CONSTRAINT uq_isbn UNIQUE (isbn),
    CONSTRAINT chk_isbn_length CHECK (CHAR_LENGTH(isbn) = 13),
    CONSTRAINT chk_publication_year CHECK (publication_year BETWEEN 1000 AND 2100),
    CONSTRAINT chk_page_count CHECK (page_count > 0),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT chk_copies_available CHECK (copies_available >= 0),
    CONSTRAINT chk_book_format CHECK (book_format IN ('HARDCOVER','PAPERBACK','EBOOK'))
);
INSERT INTO books
(isbn,title,author_name,genre,publisher,publication_year,page_count,book_format,price,copies_available,language)
VALUES
('9780134685991','Effective Java','Joshua Bloch','Programming','Pearson',2018,416,'HARDCOVER',850.00,10,'English');
SELECT * FROM books;
