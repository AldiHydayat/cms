class Question < ApplicationRecord
  belongs_to :form
  has_many :answers, dependent: :destroy
  has_many :options, -> { order(position: :asc) }, dependent: :destroy

  enum input_type: [:text_field, :text_area, :single_option, :multiple_option, :rating]
  accepts_nested_attributes_for :options
  accepts_nested_attributes_for :answers

  validates :question, presence: true
  validates :placeholder, presence: true, if: lambda { |question| ["text_field", "text_area"].include?(question.input_type) }
  validates_presence_of :options, if: lambda { |question| ["single_option", "multiple_option", "rating"].include?(question.input_type) }

  acts_as_list scope: :form

  before_destroy { |record| record.remove_from_list }
end
