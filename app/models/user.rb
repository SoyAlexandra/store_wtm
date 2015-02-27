class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true

  has_many :sells

  after_create :send_email

  def login
    User.where(email: self.email, password: self.password).first
  end

  #callback for sending the email
  def send_email
    # RegisterMailer.registration(self).deliver_now
    SendEmailJob.set(wait: 20.seconds).perform_later(self)
  end

end
