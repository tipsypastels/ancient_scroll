class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :request_id, :user_agent, :ip_address

  def user_id
    user&.id
  end
end