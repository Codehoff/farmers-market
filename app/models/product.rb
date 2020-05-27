class Product < ApplicationRecord
    has_many :orders
    has_many :reviews
    belongs_to :user
    has_one_attached :photo
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :category, presence: true
    validates :stock_info, presence: true
    validates :unit, presence: true
end
