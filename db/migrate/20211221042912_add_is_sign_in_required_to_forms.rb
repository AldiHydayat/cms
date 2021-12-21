class AddIsSignInRequiredToForms < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :is_sign_in_required, :boolean, default: false
  end
end
