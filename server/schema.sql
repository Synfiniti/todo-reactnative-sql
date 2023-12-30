CREATE DATABASE todo_tutorial;

USE todo_tutorial;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);

-- insertar usuarios 

INSERT INTO users (name, email, password) VALUES ('Jean', 'jean@example.com', 'abc');
INSERT INTO users (name, email, password) VALUES ('Karla', 'karla@example.com', 'abc');
INSERT INTO users (name, email, password) VALUES ('Juan', 'juan@example.com', 'abc');


-- insertar todos

INSERT INTO todos (title, user_id) 
VALUES 
('Manejar bicicleta por el parque', 1);

-- compartir todos
INSERT INTO shared_todos (todo_id, user_id, shared_with_id) VALUES (1, 1, 2);



SELECT todos.*, shared_todos.shared_with_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = 2 OR shared_todos.shared_with_id = 2;