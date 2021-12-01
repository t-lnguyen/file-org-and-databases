-- Builder 
insert into Builder values
					(12345, 'Builder-1', '12345 Builder Circle, Dallas TX', null),
					(23456, 'Builder-2', '23456 Builder Circle, Dallas TX', null),
					(34567, 'Builder-3', '34567 Builder Circle, Dallas TX', null),
					(45678, 'Builder-4', '45678 Builder Circle, Dallas TX', null),
					(12321, 'Builder-5', '12321 Builder Circle, Dallas TX', null);
-- Building 
-- -- Date format for INSERT: YYYY-MM-DD
insert into Building values
					(12345, '100 Main St., Dallas, TX', 'commerical', 250000, '1999/12/31', null),
					(12345, '300 Oak St., Dallas, TX', 'residential', 3000, '2000/01/01', null),
					(12345, '302 Oak St., Dallas, TX', 'residential', 4000, '2001/02/01', null),
					(12345, '304 Oak St., Dallas, TX', 'residential', 1500, '2002/03/01', null),
					(12345, '306 Oak St., Dallas, TX', 'residential', 1500, '2003/04/01', null),
					(12345, '308 Oak St., Dallas, TX', 'residential', 2000, '2003/04/01', null),
					(23456, '100 Industrial Ave., Fort Worth, TX', 'commerical', 100000, '2005/06/01', null),
					(23456, '101 Industrial Ave., Fort Worth, TX', 'commerical', 80000, '2005/06/01', null),
					(23456, '102 Industrial Ave., Fort Worth, TX', 'commerical', 75000, '2005/06/01', null),
					(23456, '103 Industrial Ave., Fort Worth, TX', 'commerical', 50000, '2005/06/01', null),
					(23456, '104 Industrial Ave., Fort Worth, TX', 'commerical', 80000, '2005/06/01', null),
					(23456, '105 Industrial Ave., Fort Worth, TX', 'commerical', 90000, '2005/06/01', null),
					(45678, '100 Winding Wood, Carrollton, TX', 'residential', 2500, null, null),
					(45678, '102 Winding Wood, Carrollton, TX', 'residential', 2800, null, null),
					(12321, '210 Cherry Bark Lane, Plano, TX', 'residential', 3200, '2016/10/01', null),
					(12321, '212 Cherry Bark Lane, Plano, TX', 'residential', null, null, null),
					(12321, '214 Cherry Bark Lane, Plano, TX', 'residential', null, null, null),
					(12321, '216 Cherry Bark Lane, Plano, TX', 'residential', null, null, null);
-- Inspection
-- Inspector
insert into Inspector values
					(101, 'Inspector-1', '1984/11/08'),
					(102, 'Inspector-2', '1994/11/08'),
					(103, 'Inspector-3', '2004/11/08'),
					(104, 'Inspector-4', '2014/11/08'),
					(105, 'Inspector-5', '2018/11/08');
-- InspectionData