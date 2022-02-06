class User < ApplicationRecord
	has_many :products

	validates :firstName, presence: true
	validates :lastName, presence: true
	validates :patronymic, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
	validates :phone, format: { with: /\d+/, message: "only allows numbers" }
end
