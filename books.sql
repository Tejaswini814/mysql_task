USE cdg_hyd_jfs_058;
CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT,
    isbn CHAR(13)NOT NULL,
    title VARCHAR(200)NOT NULL,
    author_name VARCHAR(120)NOT NULL,
    genre VARCHAR(60)NOT NULL,
    publisher VARCHAR(120),
    publiation_year SMALLINT NOT NULL,
    page_count SMALLINT NOT NULL,
    book_format VARCHAR(20) NOT NULL,
    price DECIMAL(10,2)NOT NULL,
    copies_available INT NOT NULL,
    language VARCHAR(40) NOT NULL,
    added_at TIMESTAMP NOT NULL,
    CONSTRAINT pk_book_id PRIMARY KEY(book_id),
    CONSTRAINT uq_isbn UNIQUE (isbn),
    CONSTRAINT chk_publisher_year CHECK(publisher_year)



);