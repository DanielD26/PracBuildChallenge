USE DanielD26;

IF OBJECT_ID('OWNER') IS NOT NULL
DROP TABLE OWNER;

IF OBJECT_ID('PROCEDURE') IS NOT NULL
DROP TABLE "PROCEDURE";

IF OBJECT_ID('PET') IS NOT NULL
DROP TABLE PET;

IF OBJECT_ID('TREATMENT') IS NOT NULL
DROP TABLE TREATMENT;
--------------------- CREATE TABLES --------------------
CREATE TABLE OWNER ( 
    ownerID     INT,
    surname     NVARCHAR(100),
    firstname   NVARCHAR(100),
    phone       INT,
    PRIMARY KEY (ownerID)
);

CREATE TABLE [PROCEDURE] (
    procedureID INT,
    [description] NVARCHAR(100),
    price       MONEY,
    PRIMARY KEY (procedureID)
);

CREATE TABLE PET (
    ownerID INT,
    petName NVARCHAR(100),
    type    NVARCHAR(100),
    PRIMARY KEY (ownerID, petName),
    FOREIGN KEY (ownerID) REFERENCES OWNER
);

CREATE TABLE TREATMENT (
    ownerID     INT,
    petName     NVARCHAR(100),
    procedureID INT,
    tDate       SMALLDATETIME,
    notes       NVARCHAR(100),
    payment     MONEY,
    PRIMARY KEY (ownerID, petName, procedureID, tDate),
    FOREIGN KEY (petName) REFERENCES PET (petName),
    FOREIGN KEY (ownerID) REFERENCES PET (ownerID),
    FOREIGN KEY (procedureID) REFERENCES [PROCEDURE],
)

------------- INSERT DATA INTO TABLES -------------

INSERT INTO OWNER (ownerID, surname, firstname, phone) 
VALUES (1, 'Sinatra', 'Frank', 400111222)
      ,(2, 'Ellington', 'Duke', 400222333)
      ,(3, 'Fitzgerald', 'Ella', 400333444);

INSERT INTO PET (ownerID, petName, type)
VALUES (1, 'Buster', 'Dog')
      ,(1, 'Fluffy', 'Cat')
      ,(2, 'Stew', 'Rabbit')
      ,(3, 'Buster', 'Echidna');

INSERT INTO [PROCEDURE] (procedureID, [description], price)
VALUES (01, 'Rabies Vaccination', 24.00)
      ,(10, 'Examine and Treat Wound', 30.00)
      ,(05, 'Heart Worm Test', 25.00)
      ,(08, 'Tetnus Vaccination', 17.00);


INSERT INTO TREATMENT (ownerID, petName, procedureID, tDate, notes, payment)
VALUES (1, 'Buster', '01', '2017-06-20', 'Routine Vaccination', 22.00)
      ,(1, 'Buster', '01', '2018-05-15', 'Booster Shot', 24.00)
      ,(1, 'Fluffy', '10', '2018-05-10', 'Wounds sustained in apparent cat fight', 30.00)
      ,(2, 'Stew', '10', '2018-05-10', 'Wounds sustained during attempt to cook the stew', 30.00)
      ,(3, 'Buster', '08', '2017-06-20', 'Stepped on a Rusty Nail', 17.00)
      ,(3, 'Buster', '01', '2017-06-20', 'Routine Vaccination', 22.00);


SELECT * FROM OWNER
SELECT * FROM PET
SELECT * FROM [PROCEDURE]
SELECT * FROM TREATMENT