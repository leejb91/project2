class User < ActiveRecord::Base
  after_initialize :set_default_values

  def set_default_values
    self.admin ||= false
  end

  has_secure_password
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, :length => {:minimum => 6}, on: :create
end
