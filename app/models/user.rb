class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :todos
  has_many :wikies
  has_many :collaborations
  has_many :collaborated_wikies, through: :collaborations, source: "wiky"
end
