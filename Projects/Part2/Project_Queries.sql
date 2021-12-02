
-- -- -- Project Queries -- -- -- 
-- List all buildings (building#, address, type) that have not passed a final (FNL, FN2, FN3) inspection.
select b.Address from Building b 
join Inspection i on i.Address = b.Address 
where i.Type in ('FNL', 'FN2', 'FN3') AND i.InspectionResults = 1;

-- List the id and name of inspectors
select i.EmployeeID, i.Name from Inspector i 
-- who have given 'at least one failing score'
where EXISTS
(
	select NULL from Inspection ip 
	where i.EmployeeID = ip.EmployeeID AND ip.Score < 75
);

-- What inspection type(s) have never been failed?
select DISTINCT i.Type from Inspection i 
where i.Type NOT IN 
-- records that are failed
(
	select ip.Type from Inspection ip
	where ip.InspectionResults = 0
);

-- What is the total cost of all inspections for builder 12345?
select b.LicenseID, b.Name, SUM(i.Cost) TotalCost from Builder b 
join Inspection i on i.LicenseID = b.LicenseID
where b.LicenseID = 12345;

-- What is the average score for all inspections performed by Inspector 102?
select ip.EmployeeID, ip.Name, AVG(i.Score) AverageScore from Inspector ip 
join Inspection i on i.EmployeeID = ip.EmployeeID
where ip.EmployeeID = 102;

-- How much revenue did FODB receive for inspections during October?
select SUM(i.Cost) Revenue from Inspection i
where month(i.InspectionDate) = 10;

-- How much revenue was generated this year by inspectors with more than 15 years seniority?
-- -- Assuming 'this year' is 2021
select SUM(i.Cost) Revenue from Inspection i
where i.EmployeeID in 
-- Get inspectors whose HireDate is at least 15 years from this year, 2021
(
	select ip.EmployeeID from Inspector ip
	where timestampdiff(YEAR, ip.HireDate, curdate()) >= 15
);






