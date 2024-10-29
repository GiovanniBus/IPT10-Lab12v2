CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    complete_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE questions (
    questions_id INT PRIMARY KEY AUTO_INCREMENT,
    item_number INT NOT NULL,
    question VARCHAR(100) NOT NULL,
    choices JSON NOT NULL,
    correct_answer VARCHAR(1) NOT NULL
);

CREATE TABLE exam_attempts (
    attempt_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    exam_items INT NOT NULL,
    exam_score DECIMAL(5, 2) NOT NULL,
    attempt_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_answers (
    user_answer_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    attempt_id INT NOT NULL,
    answers JSON NOT NULL,
    date_answered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (attempt_id) REFERENCES exam_attempts(attempt_id)
);