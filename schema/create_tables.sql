-- NetBoard Schema
-- --------------------------------------------------------------------------

/*
  Table: accounts
  Purpose: Stores all financial accounts such as Checking, 
  Savings, Credit Cards, Loans, Brokerages.
*/

CREATE TABLE accounts (
	account_id   INT AUTO_INCREMENT PRIMARY KEY,
	name         VARCHAR(100) NOT NULL,
	account_type ENUM('Cash', 'Investment', 'Debt') NOT NULL,
	subtype      VARCHAR(50),
	notes        TEXT,
	is_active    BOOLEAN NOT NULL DEFAULT TRUE,
	created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------------------------
/*
  Table: snapshots
  Purpose: Each row represents a date on which net worth/ balance was recorded.
*/

CREATE TABLE snapshots (
	snapshot_id   INT AUTO_INCREMENT PRIMARY KEY,
	snapshot_date DATE NOT NULL,
	notes         TEXT
);

-- --------------------------------------------------------------------------
/*
  Table: account_balances
  Purpose: Stores the balance of each account at each snapshot date.
*/

CREATE TABLE account_balances (
	balance_id   INT AUTO_INCREMENT PRIMARY KEY,
	snapshot_id  INT NOT NULL,
	account_id   INT NOT NULL,
	balance      DECIMAL(12, 2) NOT NULL,
	notes        TEXT,

	UNIQUE (snapshot_id, account_id),
	FOREIGN KEY (snapshot_id) REFERENCES snapshots(snapshot_id),
	FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
