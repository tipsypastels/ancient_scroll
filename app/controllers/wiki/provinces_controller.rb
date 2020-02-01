class Wiki::ProvincesController < Wiki::ObjectsController
  SCOPE = :provinces
  MODIFIABLE_PROPERTIES = %i|region_id|
end