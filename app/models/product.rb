class Product < ApplicationRecord
	belongs_to :user

	validates :weight, presence: true
	validates :length, presence: true
	validates :width, presence: true
	validates :height, presence: true
	validates :departure, presence: true
	validates :destination, presence: true
	validates :price, presence: true
	validates :distance, presence: true
end
