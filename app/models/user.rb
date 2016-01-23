class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  after_create :update_access_token!

  validates :username, :email, presence: true

private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
end
