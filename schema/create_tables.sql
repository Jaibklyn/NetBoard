CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	account_type ENUM('Cash', 'Investment', 'Debt') NOT NULL,
	subtype VARCHAR(50),
	notes TEXT,
	is_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
