module IsWhoPosts
  extend ActiveSupport::Concern

  included do
    scope :by_user, ->(user){ where(user_id: user) }
  end

end
