use cdg_hyd_jfs_058;
CREATE TABLE customers(
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_code VARCHAR(12)NOT NULL,
    first_name VARCHAR(50)NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    email VARCHAR(120)NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    city VARCHAR(80)NOT NULL,
    state VARCHAR(80)NOT NULL,
    postal_code VARCHAR(12)NOT NULL,
    customer_type VARCHAR(15)NOT NULL DEFAULT 'REGULAR',
    credit_limit DECIMAL(12,2)NOT NULL DEFAULT 0.00 ,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer_id PRIMARY KEY (customer_id),
    CONSTRAINT uq_customer_code UNIQUE (customer_code),
    CONSTRAINT uq_email UNIQUE (email),
    CONSTRAINT uq_phone UNIQUE (phone),
    CONSTRAINT chk_credit_limit  CHECK (credit_limit >=0),
    CONSTRAINT chk_customer_type CHECK(customer_type IN('REGULAR','PREMIUM','CORPORATE'))
);
SELECT * FROM customers;
INSERT INTO customers
(customer_code, first_name, last_name, email, phone, city, state, postal_code)
VALUES
('CUS001', 'Teja', 'Reddy', 'teja@gmail.com', NULL, 'Hyderabad', 'Telangana', '500001');
INSERT INTO customers
(customer_code, first_name, last_name, email, phone, city, state, postal_code)
VALUES
('CUS004', 'Priya', 'Rao', 'priya@gmail.com', '9876543210',
 'Hyderabad', 'Telangana', '500003');


