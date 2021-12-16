class OptionsController < ApplicationController
  before_action :set_option

  def to_higher
    @option.move_higher
    redirect_back(fallback_location: root_path)
  end

  def to_lower
    @option.move_lower
    redirect_back(fallback_location: root_path)
  end

  def remove
    @option.destroy
  end

  private

  def set_option
    @option = Option.find(params[:id])
  end
end
