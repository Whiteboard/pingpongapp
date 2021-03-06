class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :league_users
  has_many :leagues, through: :league_users

  def name
  	"#{first_name} #{last_name}"
  end
  
  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end
end
