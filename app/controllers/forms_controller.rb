class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: %i[show edit update destroy]
  before_action :admin_only

  def index
    @forms = Form.page(params[:page])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = "Membuat Form Berhasil"
      redirect_to forms_path
    else
      flash[:notice] = "Membuat Form Gagal"
      render "new"
    end
  end

  def show
    @answer = Answer.new
  end

  def edit
  end

  def update
    if @form.update(edit_form_params)
      flash[:notice] = "Update Form Successful"
      redirect_to forms_path
    else
      flash[:notice] = "Update Failed"
      redirect_to edit_form_path(@form)
    end
  end

  def destroy
    if @form.destroy
      flash[:notice] = "Delete Form Successful"
    else
      flash[:notice] = "Delete Form Failed"
    end
      redirect_to forms_path
  end

  private

  def form_params
    params.require("form")
    .permit(:title, :description,
            questions_attributes: [:input_type, :question, :placeholder, :is_required,
                                   options_attributes: [:option_text, :option_value]])
  end

  def edit_form_params
    params.require("form")
    .permit(:title, :description,
            questions_attributes: [:input_type, :question, :placeholder, :is_required, :id,
                                   options_attributes: [:option_text, :option_value, :id]])
  end

  def set_form
    @form = Form.find(params[:id])
  end

  def admin_only
    if current_user.level != "admin"
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end
end
