class User < ActiveRecord::Base
	validates :user_name, presence: true
	validates :user_age,presence: true
	validates :user_role, presence: true
	validates :user_gender, presence: true

	belongs_to :movie
end
