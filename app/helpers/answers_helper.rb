module AnswersHelper
	def group_by_question(answers)
		answers.sort_by { | answer | answer.question.position }.group_by(&:question).to_h
	end
end
