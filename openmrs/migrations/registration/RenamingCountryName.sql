# Renaming country name variables - Gaza to Palestine
SET @currentValue := "Gaza";
SET @newValue := "Palestine";

# Renaming Address Hierarchy Entry Country value
UPDATE address_hierarchy_entry
SET name = @newValue
WHERE name = @currentValue AND level_id = 1;

# Renaming Person Address3 value
UPDATE person_address
SET address3 = @newValue
WHERE address3 = @currentValue;