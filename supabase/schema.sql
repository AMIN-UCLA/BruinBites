-- Create meal_periods table
CREATE TABLE meal_periods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

-- Create dish_meal_periods junction table
CREATE TABLE dish_meal_periods (
    dish_id INTEGER REFERENCES dishes(id),
    meal_period_id INTEGER REFERENCES meal_periods(id),
    dining_hall_id INTEGER REFERENCES dining_halls(id),
    date DATE NOT NULL,
    PRIMARY KEY (dish_id, meal_period_id, dining_hall_id, date)
);

-- Insert meal periods
INSERT INTO meal_periods (name, start_time, end_time) VALUES
    ('Breakfast', '00:00:00', '10:00:00'),
    ('Lunch', '10:00:00', '15:00:00'),
    ('Dinner', '15:00:00', '23:59:59');

-- Create updated_at trigger function 