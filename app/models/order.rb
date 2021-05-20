class Order < ApplicationRecord
    belongs_to :cusutomer
    has_many :order_items, dependent: :destroy
end
