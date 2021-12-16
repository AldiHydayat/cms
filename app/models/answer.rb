class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :option, optional: true

  before_save :check_options

  validates :question_id, :user_id, presence: true

  def check_options
    debugger if option_id.instance_of?(Array)
  end
end
