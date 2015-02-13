class User < ActiveRecord::Base
	validates :name, presence: true
	has_many :sells

  def login
    User.where(email: self.email, password: self.password).first
  end

end
