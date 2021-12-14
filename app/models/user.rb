class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :name, presence: true

  enum level: [:admin, :user], _default: "user"
end
