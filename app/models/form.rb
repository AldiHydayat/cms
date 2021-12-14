class Form < ApplicationRecord
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions

  validates :title, :description, presence: true
  validates_presence_of :questions
end
