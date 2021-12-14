class FormsController < ApplicationController
  before_action :set_form, only: %i[show]

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    # render plain: @form.inspect
    if @form.save
      flash[:notice] = "Membuat Form Berhasil"
      redirect_to forms_path
    else
      flash[:notice] = "Membuat Form Berhasil"
      render "new"
    end
  end

  def show
    @answer = Answer.new
  end

  private

  def form_params
    params.require("form")
    .permit(:title, :description,
            questions_attributes: [:input_type, :question, :placeholder, :is_required,
                                   options_attributes: [:option_text, :option_value]])
  end

  def set_form
    @form = Form.find(params[:id])
  end
end
