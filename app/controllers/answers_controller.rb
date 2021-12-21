class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_only, except: %i[index summary]
  before_action :admin_only, only: %i[index summary]
  before_action :set_form, except: %i[summary]

  def index
    answers_data = @form.get_answers
    @answers = Kaminari.paginate_array(answers_data, total_count: answers_data.count).page(params[:page]).per(10)
  end

  def new
    @answer = Answer.new
  end

  def create
    @user = User.find(params[:user][:id])

    if @user.update(answer_params)
      flash[:notice] = "Answer Form Successful"
      redirect_to root_path
    else
      flash[:notice] = "Answer Form Failed"
      render "new"
    end
  end

  def summary
    @form = Form.find(params[:id])
  end

  private

  def user_only
    if current_user.level != "user"
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end

  def admin_only
    if current_user.level != "admin"
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end

  def set_form
    @form = Form.find(params[:form_id])
  end

  def answer_params
    params[:user][:answers_attributes].values.each do |val|
      if val.keys.length <= 1
        key = params[:user][:answers_attributes].permit!.to_h.key(val)
        params[:user][:answers_attributes].delete(key)
      end
    end

    params.require(:user)
    .permit(:id, answers_attributes: [:id, :question_id, :value, :option_id])
  end

end
