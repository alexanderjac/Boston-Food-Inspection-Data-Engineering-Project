Create Table Business (
    DimB_SK INT Not NULL,
    businessname VARCHAR(100),
    dbaname VARCHAR(100),
    legalowner VARCHAR(100),
    namelast VARCHAR(100),
    namefirst VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    zip INT,
    property_id VARCHAR(100),
	dayphn bigint, 
    Latitude BIGINT,
    Longitude BIGINT,
    CONSTRAINT Business_PK PRIMARY KEY (DimB_SK)
)

Create Table License (
    DimL_SK INT Not NULL,
    licenseno INT,
    issdttm DATETIME,
    expdttm DATETIME,
    licstatus VARCHAR(20),
    licensecat VARCHAR(20),
    descript VARCHAR(20),
    CONSTRAINT License_PK PRIMARY KEY (DimL_SK)
)

Create table Violation(
    DimV_SK INT Not NULL,
    violation VARCHAR(100),
    violdesc VARCHAR(100),
    violdttm DATETIME,
    violstatus VARCHAR(20),
    statusdate DATETIME,
	result VARCHAR(20),
    resultdttm DATETIME,
    comments VARCHAR(100),
    
    CONSTRAINT Violation_PK PRIMARY KEY (DimV_SK)
)



Create Table BostonFact(
    Business_SK INT Not NULL,
    License_SK INT Not NULL,
    Violation_SK INT Not NULL,
    Violation_level INT,
	DateKey int,
    CONSTRAINT Business_FK FOREIGN KEY(Business_SK) REFERENCES Business(DimB_SK),
    CONSTRAINT License_FK FOREIGN KEY (License_SK) REFERENCES License(DimL_SK),
    CONSTRAINT Violation_FK FOREIGN KEY(Violation_SK) REFERENCES Violation(DimV_SK),
    CONSTRAINT BostonFact_PK PRIMARY KEY(Business_SK,License_SK,Violation_SK)
	)

