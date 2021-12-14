class Question < ApplicationRecord
  belongs_to :form
  has_many :answers, dependent: :destroy
  has_many :options, dependent: :destroy

  enum input_type: [:text_field, :text_area, :single_option, :multiple_option, :rating]
  accepts_nested_attributes_for :options

  acts_as_list
end
