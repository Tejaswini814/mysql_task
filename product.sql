USE cdg_hyd_jfs_058;
CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    sku VARCHAR(20) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(80) NOT NULL,
    brand VARCHAR(80),
    unit_price DECIMAL(12,2) NOT NULL,
    quantity_in_stock INT UNSIGNED NOT NULL DEFAULT 0,
    reorder_level INT UNSIGNED NOT NULL DEFAULT 5,
    manufacture_date DATE,
    expiry_date DATE,
    product_status VARCHAR(15) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_product_id PRIMARY KEY (product_id),
    CONSTRAINT uq_sku UNIQUE (sku),
    CONSTRAINT chk_unit_price CHECK (unit_price > 0),
    CONSTRAINT chk_stock_quantity CHECK (quantity_in_stock >= 0),
    CONSTRAINT chk_reorder_level CHECK (reorder_level >= 0),
    CONSTRAINT chk_dates CHECK (expiry_date IS NULL OR manufacture_date IS NULL OR expiry_date >= manufacture_date),
    CONSTRAINT chk_product_status CHECK (product_status IN ('ACTIVE', 'OUT_OF_STOCK', 'DISCONTINUED'))
);
SELECT * FROM products;
INSERT INTO products (product_id, sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, product_status)
VALUES (01, 'SKU001', 'Laptop', 'Electronics', 'Dell', 55000.00, 20, 5, 'ACTIVE');
INSERT INTO products (product_id, sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES (2, 'SKU002', 'Office Chair', 'Furniture', 'Nilkamal', 4500.00, 15, 5, '2026-02-10', NULL, 'ACTIVE');
INSERT INTO products(product_id,sku,product_name,category,brand,unit_price,quantity_in_stock,reorder_level,manufacture_date,expiry_date, product_status)
VALUES(3,'SKU003','Keyboard','Electronics','HP',-1200.00,10,5,'2026-03-01','2028-03-01','ACTIVE');