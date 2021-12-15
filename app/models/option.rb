class Option < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :question

  acts_as_list scope: [:question_id]
end
