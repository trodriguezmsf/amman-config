DROP PROCEDURE IF EXISTS updateBedInTheLocation;
#
CREATE PROCEDURE updateBedInTheLocation
   (
      IN bedNumber nvarchar(30),
      IN locationName nvarchar(50),
      IN rowNumber nvarchar(20),
      IN columnNumber nvarchar(20)
   )
BEGIN
    SELECT location_id INTO @locationId FROM location WHERE location.name=locationName;
   UPDATE bed SET bed_number = bedNumber WHERE bed_id IN (SELECT bed_id FROM bed_location_map WHERE row_number = rowNumber AND column_number = columnNumber AND location_id = @locationId);
END
#

