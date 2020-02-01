class Wiki::TrainerClassesController < Wiki::ObjectsController
  SCOPE = :trainer_classes
  MODIFIABLE_PROPERTIES = %i|specialty|
end