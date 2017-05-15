class Setting < ApplicationRecord

  validates :quote_update_interval,
            presence: true,
            numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 60}

end
