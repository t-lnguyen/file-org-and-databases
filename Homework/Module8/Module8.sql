-- 2b
CREATE TABLE Car
(
    vin int not null,
    price int,
    model varchar(50),
    engine_size int,
    PRIMARY KEY (vin)
);

CREATE TABLE Truck
(
    vin int not null,
    price int,
    model varchar(50),
    engine_size int,
    PRIMARY KEY (vin)
);

CREATE TABLE SUV
(
    vin int not null,
    price int,
    model varchar(50),
    engine_size int,
    PRIMARY KEY (vin)
);

-- trigger that ensures a VIN can only appear in one table
-- i.e. check that a VIN is unique to a vehicle and only that vehicle
delimiter |
CREATE TRIGGER car_vin_check
BEFORE INSERT ON Car
FOR EACH ROW
BEGIN
    IF(
        EXISTS(select t.vin from Truck t where t.vin = NEW.vin) OR 
        EXISTS(select s.vin from SUV s where s.vin = NEW.vin)) THEN
            signal sqlstate '45000' set message_text = 'VIN must be unique for vehicle';  
        END IF;
END
|
delimiter ;

delimiter |
CREATE TRIGGER suv_vin_check
BEFORE INSERT ON SUV
FOR EACH ROW
BEGIN
    IF(
        EXISTS(select t.vin from Truck t where t.vin = NEW.vin) OR 
        EXISTS(select c.vin from Car c where c.vin = NEW.vin)) THEN
            signal sqlstate '45000' set message_text = 'VIN must be unique for vehicle';  
        END IF;
END
|
delimiter ;

delimiter |
CREATE TRIGGER truck_vin_check
BEFORE INSERT ON Truck
FOR EACH ROW
BEGIN
    IF(
        EXISTS(select c.vin from Car c where c.vin = NEW.vin) OR 
        EXISTS(select s.vin from SUV s where s.vin = NEW.vin)) THEN
            signal sqlstate '45000' set message_text = 'VIN must be unique for vehicle';  
        END IF;
END
|
delimiter ;

-- insert  3 sample data
insert into Truck values(125, 30000, 'Tundra', 3);
insert into Car values(125, 13000, 'Elantra', 3);
insert into SUV values(122, 20000, 'Sonata', 3);
-- *********PAGE BREAK**********



-- 3a
drop table if exists R;
create table R 
(
	a int, 
    b int, 
    primary key(a,b)
);

-- 3b
drop temporary table if exists V1;
create temporary table V1 select A+B as S, A-B as D from R where A between 1 and 10;
-- 3c
-- trigger for inserts
drop trigger if exists updates_for_v1_on_insert;
delimiter |
CREATE TRIGGER updates_for_v1_on_insert
AFTER INSERT on R
FOR EACH ROW
BEGIN
	-- make sure NEW.A is between 1 and 10 
    IF NEW.A >= 1 AND NEW.A <= 10 THEN
		INSERT INTO V1 VALUES(NEW.A + NEW.B, NEW.A - NEW.B);
	ELSE
		signal sqlstate '45000' set message_text = 'Value A not between 1 and 10 for V1 temp table';
    END IF;
END;
|
delimiter ;

-- trigger for delete
drop trigger if exists updates_for_v1_on_delete;
delimiter |
CREATE TRIGGER updates_for_v1_on_delete
AFTER DELETE on  R
FOR EACH ROW
BEGIN
	DELETE FROM V1 WHERE V1.S = OLD.A + OLD.B AND V1.D = OLD.A - OLD.B;
END;
|
delimiter ;

-- 3c
select * from R;
select * from v1;
-- inserting values into R should mean values into V1
insert into R VALUES(10, 4);
insert into R VALUES(1, 1);
insert into R VALUES(3, 4);
insert into R VALUES(9, 9);
insert into R VALUES(10, 11);

-- inserting values into R outside of V1's where range 
insert into R VALUES(11, 2);
insert into R VALUES(0, 3);
-- deleting valid values from R should mean deleting the same values from V1
SET SQL_SAFE_UPDATES=0;
delete from R where R.a = 10 AND R.b = 4;
delete from R where R.a = 1 AND R.b = 1;
delete from R where R.a = 3 AND R.b = 4;
delete from R where R.a = 9 AND R.b = 9;
delete from R where R.a = 10 AND R.b = 11;
SET SQL_SAFE_UPDATES=1;
