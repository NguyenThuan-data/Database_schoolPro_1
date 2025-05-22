
CREATE TABLE Location (
    LocationID VARCHAR2(7) PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Latitude NUMBER(19),
    Longitude NUMBER(19),
    Description VARCHAR2(255)
);
CREATE TABLE Road (
    RoadID VARCHAR2(100) PRIMARY KEY,
    RoadName VARCHAR2(100) NOT NULL,
    Description VARCHAR2(255),
    Category VARCHAR2(50),
    Length NUMBER(5),
    LocationID VARCHAR2(7) NOT NULL,
    main_road_id VARCHAR2(7),
    CONSTRAINT road_location_id_fk FOREIGN KEY (LocationID) REFERENCES location (LocationID),
    CONSTRAINT road_main_road_fk FOREIGN KEY (main_road_id) REFERENCES Road (RoadID)

);
CREATE TABLE Project (
    ProjectID NUMBER PRIMARY KEY,
    ProjectName VARCHAR2(100) NOT NULL,
    Description VARCHAR2(255),
    DateStarted DATE NOT NULL,
    DateCompleted DATE
);
CREATE TABLE Staff (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    DateFirstEmployed DATE NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1),
    PostalAddress VARCHAR2(255),
    PhoneNumber VARCHAR2(15),
    EmailAddress VARCHAR2(100)
);
CREATE TABLE Role (
    RoleName VARCHAR2(50) PRIMARY KEY,
    Description VARCHAR2(255)
);
CREATE TABLE Contractor (
    ContractorName VARCHAR2(100) PRIMARY KEY,
    Address VARCHAR2(255),
    ContactDetails VARCHAR2(255)
);
CREATE TABLE Contract (
    ContractNumber NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Description VARCHAR2(255),
    ActualCost NUMBER(10, 2),
    EstimatedCost NUMBER(10, 2),
    DateStarted DATE NOT NULL,
    DateEnded DATE,
    ContractorID VARCHAR2(100) NOT NULL,
    ProjectID NUMBER NOT NULL, 
    ContractorName VARCHAR2(100),
    CONSTRAINT fk_contractor FOREIGN KEY (ContractorID) REFERENCES Contractor(ContractorName),
    CONSTRAINT fk_project FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
CREATE TABLE Project_Road (
    ProjectID NUMBER NOT NULL,
    RoadID VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ProjectID, RoadID),
    CONSTRAINT fk_project_road FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    CONSTRAINT fk_road_project FOREIGN KEY (RoadID) REFERENCES Road(RoadID)
);
CREATE TABLE Project_Staff (
    ProjectID NUMBER NOT NULL,
    EmployeeID NUMBER NOT NULL,
    PRIMARY KEY (ProjectID, EmployeeID),
    CONSTRAINT fk_project_staff FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    CONSTRAINT fk_employee_project FOREIGN KEY (EmployeeID) REFERENCES Staff(EmployeeID)
);
CREATE TABLE ContractRoleStaff (
    ContractNumber NUMBER NOT NULL,
    RoleName VARCHAR2(50) NOT NULL,
    EmployeeID NUMBER NOT NULL,
    DateStarted DATE NOT NULL,
    DateEnded DATE,
    PRIMARY KEY (ContractNumber, RoleName, EmployeeID),
    CONSTRAINT fk_contract FOREIGN KEY (ContractNumber) REFERENCES Contract(ContractNumber),
    CONSTRAINT fk_role FOREIGN KEY (RoleName) REFERENCES Role(RoleName),
    CONSTRAINT fk_employee FOREIGN KEY (EmployeeID) REFERENCES Staff(EmployeeID)
);

-- Insert data into Location
INSERT INTO Location (LocationID, Name, Latitude, Longitude, Description)
VALUES 
    ('LOC001', 'Auckland', 40.7128, -74.0060, 'Most population city in NZ');
INSERT INTO Location (LocationID, Name, Latitude, Longitude, Description)
VALUES 
    ('LOC002', 'Wellington', 40.6782, -73.9442, 'Capital city of NZ');
INSERT INTO Location (LocationID, Name, Latitude, Longitude, Description)
VALUES 
    ('LOC003', 'Queenstown', 40.7282, -74.0776, 'Most beautiful city in NZ');
INSERT INTO Location (LocationID, Name, Latitude, Longitude, Description)
VALUES 
    ('LOC004', 'Hamilton', 40.7851, -73.9683, NULL);
INSERT INTO Location (LocationID, Name, Latitude, Longitude, Description)
VALUES
    ('LOC005', 'Christchurch', 40.6413, -73.7781, NULL);
COMMIT;

--road table
INSERT INTO Road (RoadID, RoadName, Description, Category, Length, LocationID, main_road_id)
        VALUES ('RD0001', 'Queens Street', 'Main Street in Auckland', 'Commerical', 3, 'LOC001', NULL);
INSERT INTO Road (RoadID, RoadName, Description, Category, Length, LocationID, main_road_id)
        VALUES ('RD0002', 'Karangahape Road', 'LGBT street in New Zealand', 'Tourism', 1, 'LOC001', NULL);
INSERT INTO Road (RoadID, RoadName, Description, Category, Length, LocationID, main_road_id)
        VALUES ('RD0003', 'Lorne Street', NULL, 'Commerical',0.4, 'LOC001', NULL);
INSERT INTO Road (RoadID, RoadName, Description, Category, Length, LocationID, main_road_id)
        VALUES ('RD0004', 'Karori Road', NULL, 'Scenic', 4, 'LOC002', NULL);
INSERT INTO Road (RoadID, RoadName, Description, Category, Length, LocationID, main_road_id)
        VALUES ('RD0005', 'Dominion Road', 'Asian Street', 'Tourism', 1, 'LOC001', 'RD0001');
COMMIT;

-- Insert data into Project
INSERT INTO Project (ProjectID, ProjectName, Description, DateStarted, DateCompleted)
VALUES
    ('001', 'Downtown Revamp', 'Renovation of downtown area', TO_DATE('2023-01-01', 'YYYY-MM-DD'),NULL);
INSERT INTO Project (ProjectID, ProjectName, Description, DateStarted, DateCompleted)
VALUES
    ('002', 'Suburbia Extension', 'Expanding residential area', TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'));
INSERT INTO Project (ProjectID, ProjectName, Description, DateStarted, DateCompleted)
VALUES
    ('003', 'Industrial Park Expansion', 'Adding new facilities to industrial park', TO_DATE('2023-03-01', 'YYYY-MM-DD'),NULL);
INSERT INTO Project (ProjectID, ProjectName, Description, DateStarted, DateCompleted)
VALUES
    ('004', 'City Park Redesign', 'Improvement of green spaces in city park', TO_DATE('2023-04-01', 'YYYY-MM-DD'),NULL);
INSERT INTO Project (ProjectID, ProjectName, Description, DateStarted, DateCompleted)
VALUES
    ('005', 'Airport Upgrade', 'Upgrading facilities at the airport', TO_DATE('2023-05-01', 'YYYY-MM-DD'),NULL);
COMMIT;

--staff table
INSERT INTO Staff (EmployeeID, FirstName, LastName, DateFirstEmployed, DateOfBirth, Gender, PostalAddress, PhoneNumber, EmailAddress)
VALUES
    (1001, 'John', 'Doe', TO_DATE('2010-05-01', 'YYYY-MM-DD'), TO_DATE('1985-02-10', 'YYYY-MM-DD'), 'M', '123 Queen St, AucklandCBD', '555-1234', 'john.doe@example.com');
INSERT INTO Staff (EmployeeID, FirstName, LastName, DateFirstEmployed, DateOfBirth, Gender, PostalAddress, PhoneNumber, EmailAddress)
VALUES
    (1002, 'Jane', 'Smith', TO_DATE('2012-08-10', 'YYYY-MM-DD'), TO_DATE('1990-07-05', 'YYYY-MM-DD'), 'F', '456 High St, Suburb', '555-5678', 'jane.smith@example.com');
INSERT INTO Staff (EmployeeID, FirstName, LastName, DateFirstEmployed, DateOfBirth, Gender, PostalAddress, PhoneNumber, EmailAddress)
VALUES
    (1003, 'Bill', 'Brown', TO_DATE('2015-03-20', 'YYYY-MM-DD'), TO_DATE('1988-11-22', 'YYYY-MM-DD'), 'M', '789 Dominion Rd, City', '555-9012', 'bill.brown@example.com');
INSERT INTO Staff (EmployeeID, FirstName, LastName, DateFirstEmployed, DateOfBirth, Gender, PostalAddress, PhoneNumber, EmailAddress)
VALUES
    (1004, 'Susan', 'Clark', TO_DATE('2018-01-15', 'YYYY-MM-DD'), TO_DATE('1992-03-30', 'YYYY-MM-DD'), 'F', '321 K Road, City', '555-3456', 'susan.clark@example.com');
INSERT INTO Staff (EmployeeID, FirstName, LastName, DateFirstEmployed, DateOfBirth, Gender, PostalAddress, PhoneNumber, EmailAddress)
VALUES
    (1005, 'Robert', 'Johnson', TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('1995-06-17', 'YYYY-MM-DD'), 'M', '654 Airport Rd, City', '555-7890', 'robert.johnson@example.com');
COMMIT;

INSERT INTO Role (RoleName, Description)
VALUES
    ('Manager', 'Responsible for overseeing projects');
INSERT INTO Role (RoleName, Description)
VALUES
    ('Engineer', 'In charge of technical aspects');
INSERT INTO Role (RoleName, Description)
VALUES
    ('Foreman', 'Leads the construction team');
INSERT INTO Role (RoleName, Description)
VALUES
    ('Architect', 'Designs the project plans');
INSERT INTO Role (RoleName, Description)
VALUES
    ('Consultant', 'Provides expert advice');
COMMIT;

-- Insert data into Contractor
INSERT INTO Contractor (ContractorName, Address, ContactDetails)
VALUES
    ('COMPANY1', '123 Industrial Ave, City', 'contact@buildcorp.com');
INSERT INTO Contractor (ContractorName, Address, ContactDetails)
VALUES
    ('COMPANY12', '789 Park Blvd, Suburbia', 'info@greenworks.com');
INSERT INTO Contractor (ContractorName, Address, ContactDetails)
VALUES
    ('COMPANY123', '456 City Center St, Downtown', 'support@urbandevelop.com');
INSERT INTO Contractor (ContractorName, Address, ContactDetails)
VALUES
    ('COMPANY1234', '101 Tower St, City', 'contact@skyline.com');
INSERT INTO Contractor (ContractorName, Address, ContactDetails)
VALUES
    ('COMPANY1231', '202 Eco Rd, City', 'contact@ecobuilders.com');
COMMIT;



-- Insert data into Project_Road
INSERT INTO Project_Road (ProjectID, RoadID)
VALUES
    ('001', 'RD0001');
INSERT INTO Project_Road (ProjectID, RoadID)
VALUES
    ('001', 'RD0002');
INSERT INTO Project_Road (ProjectID, RoadID)
VALUES
    ('002', 'RD0003');
INSERT INTO Project_Road (ProjectID, RoadID)
VALUES
    ('003', 'RD0004');
INSERT INTO Project_Road (ProjectID, RoadID)
VALUES
    ('004', 'RD0005');
COMMIT;

-- Insert data into Project_Staff
INSERT INTO Project_Staff (ProjectID, EmployeeID)
VALUES
    ('001', 1001);
INSERT INTO Project_Staff (ProjectID, EmployeeID)
VALUES
    ('001', 1003);
INSERT INTO Project_Staff (ProjectID, EmployeeID)
VALUES
    ('002', 1002);
INSERT INTO Project_Staff (ProjectID, EmployeeID)
VALUES
    ('003', 1004);
INSERT INTO Project_Staff (ProjectID, EmployeeID)
VALUES
    ('004', 1005);
COMMIT;

-- Insert data into ContractRoleStaff
INSERT INTO ContractRoleStaff (ContractNumber, RoleName, EmployeeID, DateStarted, DateEnded)
VALUES
    (101, 'Manager', 1001, TO_DATE('2023-01-10', 'YYYY-MM-DD'), NULL);
INSERT INTO ContractRoleStaff (ContractNumber, RoleName, EmployeeID, DateStarted, DateEnded)
VALUES
    (102, 'Engineer', 1002, TO_DATE('2022-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO ContractRoleStaff (ContractNumber, RoleName, EmployeeID, DateStarted, DateEnded)
VALUES
    (103, 'Foreman', 1003, TO_DATE('2023-03-05', 'YYYY-MM-DD'), NULL);
INSERT INTO ContractRoleStaff (ContractNumber, RoleName, EmployeeID, DateStarted, DateEnded)
VALUES
    (104, 'Architect', 1004, TO_DATE('2023-04-15', 'YYYY-MM-DD'), NULL);
INSERT INTO ContractRoleStaff (ContractNumber, RoleName, EmployeeID, DateStarted, DateEnded)
VALUES
    (105, 'Consultant', 1005, TO_DATE('2023-05-10', 'YYYY-MM-DD'), NULL);
COMMIT;

SELECT table_name FROM user_tables;
SELECT * FROM Location;
SELECT * FROM Road;
SELECT * FROM Contract;
SELECT * FROM Contractor;
SELECT * FROM contractrolestaff;
SELECT * FROM Project;
SELECT * FROM Project_Staff;
SELECT * FROM Role;
SELECT * FROM Staff;
SELECT * FROM Project_Road;

SELECT 
    p.ProjectName, 
    r.RoadName, 
    r.Length 
FROM 
    Project p
JOIN 
    Project_Road pr ON p.ProjectID = pr.ProjectID
JOIN 
    Road r ON pr.RoadID = r.RoadID
ORDER BY 
    p.ProjectName, r.RoadName;
    

SELECT 
    c.ContractorName, 
    SUM(ct.ActualCost) AS TotalCost, 
    AVG(ct.ActualCost) AS AvgCost
FROM 
    Contract ct
JOIN 
    Contractor c ON ct.ContractorName = c.ContractorName
GROUP BY 
    c.ContractorName
HAVING 
    SUM(ct.ActualCost) > 10000
ORDER BY 
    TotalCost DESC;
    

SELECT 
    RoadID, 
    RoadName, 
    Length
FROM 
    Road
WHERE 
    main_road_id IS NULL;
    

SELECT 
    c.ContractNumber, 
    c.Name AS ContractName, 
    ctr.ContractorName, 
    c.ActualCost, 
    c.EstimatedCost, 
    (c.ActualCost - c.EstimatedCost) AS CostDifference
FROM 
    Contract c
JOIN 
    Contractor ctr ON c.ContractorName = ctr.ContractorName
ORDER BY 
    CostDifference DESC;
    

SELECT 
    l.Name AS Location, 
    SUM(r.Length) / 1000 AS TotalRoadLengthInKM
FROM 
    Road r
JOIN 
    Location l ON r.LocationID = l.LocationID
GROUP BY 
    l.Name
ORDER BY 
    l.Name DESC;








