class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization, optional: true
  has_many :requests
  belongs_to :evacuation_point, optional: true

  # validates :organization, allow_nil: true
  # validates :evacuation_point, allow_nil: true

end
