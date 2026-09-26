USE cdg_hyd_jfs_058;

CREATE TABLE support_tickets (
    ticket_id INT NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(20) NOT NULL,
    requester_name VARCHAR(120) NOT NULL,
    requester_email VARCHAR(120) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(20) NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    ticket_status VARCHAR(20) NOT NULL DEFAULT 'OPEN',
    assigned_agent VARCHAR(120),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    last_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   CONSTRAINT pk_ticket_id PRIMARY KEY (ticket_id),
    CONSTRAINT uk_ticket_number UNIQUE (ticket_number),
    CONSTRAINT chk_category CHECK (category IN ('BILLING','TECHNICAL','ACCOUNT','GENERAL')),
    CONSTRAINT chk_priority CHECK (priority IN ('LOW','MEDIUM','HIGH','CRITICAL')),
    CONSTRAINT chk_ticket_status CHECK (ticket_status IN ('OPEN','IN_PROGRESS','RESOLVED','CLOSED')),
    CONSTRAINT chk_resolved_at CHECK (resolved_at IS NULL OR resolved_at >= created_at)
);
SELECT * FROM support_tickets;
INSERT INTO support_tickets (ticket_number,requester_name,requester_email,subject,description,category)
VALUES ('TKT001','Ananya Rao','ananya@example.com','Unable to login','Customer is unable to login to the application.','ACCOUNT');
INSERT INTO support_tickets (ticket_number,requester_name,requester_email,subject,description,category) 
VALUES ('TKT001','Ananya Rao','ananya@example.com','Unable to login','Customer is unable to login to the application.','ACCOUNT');