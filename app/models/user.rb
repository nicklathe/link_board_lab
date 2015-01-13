class User < ActiveRecord::Base

  has_many :posts

  has_secure_password

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation

  validates :name,
    presence: true,
    uniqueness: {case_sensitive: false},
    length: {in: 1..20}

  def self.authenticate name, password
    User.find_by_name(name).try(:authenticate, password)
  end

end
