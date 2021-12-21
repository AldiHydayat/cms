class AnswersController < ApplicationController
  before_action :admin_only, only: %i[index summary]
  before_action :set_form, except: %i[summary]
  before_action :is_must_sign_in?, only: %i[new create]

  def index
    # Belum Beres
    answers_data = @form.get_answers
    @answers = Kaminari.paginate_array(answers_data, total_count: answers_data.count).page(params[:page]).per(10)
  end

  def new
    @answer = Answer.new
  end

  def create
    if params[:user].present?
      @user = User.find(params[:user][:id])

      if @user.update(answer_params)
        flash[:notice] = "Answer Form Successful"
        redirect_to root_path
      else
        flash[:notice] = "Answer Form Failed"
        render "new"
      end
    else
      @answers = Answer.create(answer_params_tag)
      if @answers
        flash[:notice] = "Answer Form Successful"
        redirect_to root_path
      else
        flash[:notice] = "Answer Form Failed"
        render "new"
      end
    end
  end

  def summary
    @form = Form.find(params[:id])
  end

  private

  def is_must_sign_in?
    if @form.is_sign_in_required && !user_signed_in?
      flash[:notice] = "Login Required"
      redirect_to new_user_session_path
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

  def answer_params_tag
    params[:answers].values.each do |val|
      if val.keys.length <= 1 || ( val[:value].blank? && val[:option_id].blank? )
        key = params[:answers].permit!.to_h.key(val)
        params[:answers].delete(key)
      end
    end

    params[:answers].values
  end

end
