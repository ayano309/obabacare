module SetOrder
  extend ActiveSupport::Concern

  included do
    scope :set_order, -> (order){ order(order) }
  end

end
