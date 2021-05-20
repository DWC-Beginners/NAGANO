class CartItem < ApplicationRecord
    belongs_to :cusutomer
    belongs_to :product
end
