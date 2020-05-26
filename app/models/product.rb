class Product < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :category, presence: true
    validates :stock_info, presence: true
    validates :unit, presence: true

end
