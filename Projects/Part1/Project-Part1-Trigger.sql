-- trigger that ensures an inspection is assigned to an inspector hired before the date of the inspection
delimiter |
CREATE TRIGGER check_inspection_assignment
BEFORE INSERT ON Inspection 
FOR EACH ROW
BEGIN
    IF(
        -- Ensure that every time an Inspection is requested, an Inspection is assigned
        NOT EXISTS(select i.InspectionID from Inspector i where NEW.InspectionID = i.InspectionID)) THEN
            signal sqlstate '45000' set message_text = 'Inspector must be assigned to Inspection before the inspection date';  
    END IF;
END
|
delimiter ;