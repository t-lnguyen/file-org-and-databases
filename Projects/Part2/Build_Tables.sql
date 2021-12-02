
CREATE TABLE Builder
(
  LicenseID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(200) NOT NULL,
  InspectionOrderID INT,
  PRIMARY KEY (LicenseID)
);

CREATE TABLE Building
(
  BuilderID INT NOT NULL,
  Address VARCHAR(200) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  Size INT,
  DateFirstActivity DATE,
  InspectionRecordID INT,
  PRIMARY KEY (Address),
  FOREIGN KEY (BuilderID) REFERENCES Builder(LicenseID),
  FOREIGN KEY (InspectionRecordID) REFERENCES Inspection(InspectionID)
);

CREATE TABLE Inspector
(
  EmployeeID INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  HireDate DATE NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Inspection
(
  InspectionID INT NOT NULL,
  Type VARCHAR(3) NOT NULL,
  InspectionDate DATE NOT NULL,
  LicenseID INT,
  EmployeeID INT,
   Cost INT NOT NULL,
   Address VARCHAR(200) NOT NULL,
  PRIMARY KEY (InspectionID),
  FOREIGN KEY (LicenseID) REFERENCES Builder(LicenseID),
  FOREIGN KEY (EmployeeID) REFERENCES Inspector(EmployeeID),
  FOREIGN KEY (Address) REFERENCES Building(Address)
);

CREATE TABLE InspectionData
(
  Score INT NOT NULL,
  Details VARCHAR(100) NOT NULL,
  InspectionResults INT,
  InspectionID INT NOT NULL,
  PRIMARY KEY (InspectionID),
  FOREIGN KEY (InspectionID) REFERENCES Inspection(InspectionID)
);

CREATE TABLE Builds
(
  BuilderID INT NOT NULL,
  LicenseID INT NOT NULL,
  PRIMARY KEY (BuilderID, LicenseID),
  FOREIGN KEY (BuilderID) REFERENCES Building(BuilderID),
  FOREIGN KEY (LicenseID) REFERENCES Builder(LicenseID)
);

CREATE TABLE Contain
(
  InspectionID INT NOT NULL,
  BuilderID INT NOT NULL,
  PRIMARY KEY (InspectionID, BuilderID),
  FOREIGN KEY (InspectionID) REFERENCES Inspection(InspectionID),
  FOREIGN KEY (BuilderID) REFERENCES Building(BuilderID)
);

alter table Builder add foreign key (InspectionOrderID) references Inspection(InspectionID);
alter table Building add foreign key (BuilderID) references Builder(BuilderID);



