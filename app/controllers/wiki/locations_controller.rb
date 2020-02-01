class Wiki::LocationsController < Wiki::ObjectsController
  SCOPE = :locations
  MODIFIABLE_PROPERTIES = %i|map_type population province_id region_id|
end