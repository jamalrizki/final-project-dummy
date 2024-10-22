
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Articles;


CREATE TABLE Users (
    id INTEGER NOT NULL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    firstName TEXT,
    lastName TEXT,
    password TEXT NOT NULL,
    blurb TEXT,
    selectedAvatar TEXT,
    email TEXT NOT NULL UNIQUE,
    dob DATE NOT NULL
);


CREATE TABLE Articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    content TEXT NOT NULL,
    image TEXT NOT NULL,
    userId INTEGER NOT NULL,
    username TEXT NOT NULL,
    userAvatar TEXT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES Users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO Users (username, firstName, lastName, password, blurb, selectedAvatar, email, dob)
VALUES
    ('john_doe', 'John', 'Doe', '$2b$10$fhC03I3hcXX9alkDeES/suyoXtMTqNTxXOS1VZXqoGHcWfXjtGK5O', 'I love coding', '/avatars/avatar2.png', 'john.doe@example.com', '1990-01-15'),
    ('jane_smith', 'Jane', 'Smith', '$2b$10$fhC03I3hcXX9alkDeES/suyoXtMTqNTxXOS1VZXqoGHcWfXjtGK5O', 'Coffee enthusiast', '/avatars/avatar2.png', 'jane.smith@example.com', '1992-06-20'),
    ('michael_brown', 'Michael', 'Brown', '$2b$10$fhC03I3hcXX9alkDeES/suyoXtMTqNTxXOS1VZXqoGHcWfXjtGK5O', 'Tech geek', '/avatars/avatar2.png', 'michael.brown@example.com', '1988-11-30'),
    ('lisa_wong', 'Lisa', 'Wong', '$2b$10$fhC03I3hcXX9alkDeES/suyoXtMTqNTxXOS1VZXqoGHcWfXjtGK5O', 'Art lover', '/avatars/avatar2.png', 'lisa.wong@example.com', '1995-07-14'),
    ('david_jones', 'David', 'Jones', '$2b$10$fhC03I3hcXX9alkDeES/suyoXtMTqNTxXOS1VZXqoGHcWfXjtGK5O', 'Fitness addict', '/avatars/avatar2.png', 'david.jones@example.com', '1987-04-22');


INSERT INTO Articles (title, description, content, image, userId, username, userAvatar, date) VALUES
('Hidden Gems of Thailand', 
'Exploring off-the-beaten-path destinations in Southeast Asia', 
'Discover the secret beaches, mountain temples, and local markets that most tourists never see. Our journey through Thailand''s hidden treasures.',
'6.jpg', 
1, 'john_doe', '/avatars/avatar2.png', '2024-01-15'),

('Backpacking Through Europe', 
'Budget travel guide across European capitals', 
'From Paris to Prague, learn how to experience the best of Europe while keeping your budget intact. Tips for accommodation, transport, and food.',
'12.jpg', 
1, 'john_doe', '/avatars/avatar2.png', '2024-02-20'),

('Venice: A City on Water', 
'Navigating the historic canals and culture', 
'Experience the magic of Venice through its winding canals, historic architecture, and timeless traditions.',
'20.jpg', 
2, 'jane_smith', '/avatars/avatar2.png', '2024-01-10'),

('Safari Adventures in Kenya', 
'Wildlife encounters in East Africa', 
'Journey through Kenya''s national parks and witness the incredible wildlife in their natural habitat.',
'6.jpg', 
2, 'jane_smith', '/avatars/avatar2.png', '2024-03-01'),

('Ancient Temples of Japan', 
'A spiritual journey through Kyoto', 
'Exploring the serene temples and gardens of Kyoto, discovering Japanese traditional culture and architecture.',
'12.jpg', 
3, 'michael_brown', '/avatars/avatar2.png', '2024-02-01'),

('New Zealand''s South Island', 
'Adventure in the land of the long white cloud', 
'From glaciers to fjords, experience the breathtaking landscapes and outdoor activities of New Zealand.',
'20.jpg', 
3, 'michael_brown', '/avatars/avatar2.png', '2024-03-15'),

('Markets of Marrakech', 
'A sensory journey through Morocco''s souks', 
'Navigate the colorful markets of Marrakech, discovering traditional crafts, spices, and local culture.',
'6.jpg', 
4, 'lisa_wong', '/avatars/avatar2.png', '2024-01-25'),

('Island Hopping in Greece', 
'Mediterranean paradise exploration', 
'Journey through the stunning Greek islands, from Santorini''s sunsets to hidden beaches of Milos.',
'12.jpg', 
4, 'lisa_wong', '/avatars/avatar2.png', '2024-03-10'),

('Hiking the Inca Trail', 
'Journey to Machu Picchu', 
'A day-by-day guide to hiking the famous Inca Trail, culminating at the magnificent Machu Picchu.',
'20.jpg', 
5, 'david_jones', '/avatars/avatar2.png', '2024-02-10'),

('Costa Rica Adventure', 
'Exploring rainforests and beaches', 
'From zip-lining through rainforests to surfing Pacific waves, discover the natural wonders of Costa Rica.',
'6.jpg', 
5, 'david_jones', '/avatars/avatar2.png', '2024-03-20');