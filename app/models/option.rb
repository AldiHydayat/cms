class Option < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :question, optional: true

  acts_as_list scope: :question

  before_destroy { |record| record.remove_from_list }
end
