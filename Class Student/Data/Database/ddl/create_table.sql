CREATE TABLE student (
  id SERIAL PRIMARY KEY, 
  surname VARCHAR(40) NOT NULL,
  firstname VARCHAR(40) NOT NULL,
  lastname VARCHAR(40) NOT NULL,
  date_of_birth DATE NOT NULL,
  telegram VARCHAR(40),
  email VARCHAR(40),
  phone_number VARCHAR(40),
  git VARCHAR(40)
);