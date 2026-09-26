USE cdg_hyd_jfs_058;
CREATE TABLE bank_accounts (
    account_id INT NOT NULL AUTO_INCREMENT,
    account_number CHAR(12) NOT NULL,
    account_holder_name VARCHAR(120) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    currency_code CHAR(3) NOT NULL DEFAULT 'INR',
    branch_name VARCHAR(100) NOT NULL,
    opened_date DATE NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    overdraft_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    account_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_account_id PRIMARY KEY (account_id),
    CONSTRAINT uq_account_number UNIQUE (account_number),
    CONSTRAINT chk_account_number_length CHECK (CHAR_LENGTH(account_number) = 12),
    CONSTRAINT chk_balance CHECK (balance >= 0),
    CONSTRAINT chk_interest_rate CHECK (interest_rate BETWEEN 0.00 AND 100.00),
    CONSTRAINT chk_overdraft_limit CHECK (overdraft_limit >= 0),
    CONSTRAINT chk_account_type CHECK (
        account_type IN ('SAVINGS','CURRENT','FIXED_DEPOSIT')
    ),
    CONSTRAINT chk_account_status CHECK (
        account_status IN ('ACTIVE','FROZEN','DORMANT','CLOSED')
    )
);
SELECT * FROM bank_accounts;
INSERT INTO bank_accounts
(account_number, account_holder_name, account_type, balance, currency_code, branch_name, opened_date, interest_rate, overdraft_limit)
VALUES
('123456789001','Ananya Rao','SAVINGS',50000.00,'INR','Hyderabad Main Branch','2024-01-15',4.50,0.00);
