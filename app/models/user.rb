class User < ApplicationRecord
  extend UserExtend
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :inspections, through: :tasks
end
