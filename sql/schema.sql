-- Database Schema for P.A.I.N. Framework Analysis
-- Target Database: SQLite3

PRAGMA foreign_keys = ON;

-- 1. Lookup Table for Infrastructure Components
CREATE TABLE list_tech_components (
    component_name TEXT PRIMARY KEY
);

-- 2. Lookup Table for Failure Classifications
CREATE TABLE list_failure_types (
    type_name TEXT PRIMARY KEY
);

-- 3. Main Ledger Table
CREATE TABLE Student_Issues (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    jira_id TEXT NOT NULL,
    aws_module TEXT,
    tech_component TEXT,
    failure_type TEXT,
    notes TEXT,
    created_at DATETIME DEFAULT (DATETIME('now', 'localtime')),
    FOREIGN KEY (tech_component) REFERENCES list_tech_components (component_name),
    FOREIGN KEY (failure_type) REFERENCES list_failure_types (type_name)
);

-- 4. Initial Seed Data for Constraints
INSERT INTO list_tech_components (component_name) VALUES 
('IAM'), ('S3'), ('Lambda'), ('EC2'), ('Boto3'), ('CloudWatch');

INSERT INTO list_failure_types (type_name) VALUES 
('Permission'), ('Syntax'), ('Logic'), ('Environment'), ('Credential-Issue');