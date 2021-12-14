class AddPositionToOption < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :position, :integer
  end
end
