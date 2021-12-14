class FormsController < ApplicationController
  def index
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
      flash[:notice] = "Membuat Form Berhasil"
      render "new"
    end
  end

  private

  def form_params
    params.require("form")
    .permit(:title, :description,
            questions_attributes: [:input_type, :question, :placeholder, :is_required,
                                   options_attributes: [:option_text, :option_value]])
  end
end
