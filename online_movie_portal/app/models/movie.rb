class Movie < ActiveRecord::Base
	validates :title, presence: true,length: { minimum: 2 }
	validates :year,presence: true
	validates :rating,presence:true, :inclusion => { :in => 1..10 }
	validates :language, presence: true

	has_many :users
end
