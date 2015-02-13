class User < ActiveRecord::Base
	validates :name, presence: true
	has_many :sells
end
