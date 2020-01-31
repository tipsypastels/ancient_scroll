class Wiki::Canonicity
  extend ActsAsApi::Base

  acts_as_api
  api_accessible :show do |api|
    api.add :canon?
  end

  def canon?
    true
  end
end