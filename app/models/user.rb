class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :community, :support, :admin ]

  validates :first_name, :last_name, presence: true

  def name
    first_name + ' ' + last_name
  end

  def admin_area?
    support? || admin?
  end

end
