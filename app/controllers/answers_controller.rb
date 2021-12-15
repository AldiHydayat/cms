class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_only
  before_action :set_form

  def new
    @answer = Answer.new
  end


  def create
    # Belum Selesai
    @user = User.new(answer_params)
    render plain: @user.answers.inspect
  end

  private

  def user_only
    if current_user.level != "user"
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end

  def set_form
    @form = Form.find(params[:form_id])
  end

  def answer_params
    params.require(:user)
    .permit(answer_attributes: [:question_id, :value, :option_id])
  end

end
