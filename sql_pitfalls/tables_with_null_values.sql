CREATE TABLE S (
    id SERIAL PRIMARY KEY NOT NULL,
    SNO VARCHAR(25) NOT NULL,
    City VARCHAR(25),
    sqltime TIMESTAMP DEFAULT now() NOT NULL

);
CREATE TABLE P (
    id SERIAL PRIMARY KEY  NOT NULL,
    PNO VARCHAR(25) NOT NULL,
    City VARCHAR(25),
    sqltime TIMESTAMP DEFAULT now() NOT NULL 
);
INSERT INTO S (SNO, City) VALUES('S1','London');
INSERT INTO P (PNO) VALUES('P1');	 
