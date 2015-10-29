class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :about_me, :string
  end
end
