class User < ApplicationRecord
  has_many :sportactions
  has_many :sports, :through => :actions
  has_many :employees, :through => :actions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
