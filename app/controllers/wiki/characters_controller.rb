class Wiki::CharactersController < Wiki::ObjectsController
  SCOPE = :characters
  MODIFIABLE_PROPERTIES = %i|age gender trainer_class_id hometown_id specialty story_role|
end