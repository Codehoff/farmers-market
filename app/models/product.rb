class Product < ApplicationRecord
    has_many :orders
    has_many :reviews, dependent: :destroy
    belongs_to :category
    belongs_to :user
    has_many_attached :photos
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :stock_info, presence: true
    validates :stock_info, inclusion: { in: (0..100000000),
        message: "can not be negative" }
    validates :unit, presence: true
    serialize :buyer, Array
end
