class CreateComments < ActiveRecord::Migration
  using(:commentshard)
  def change
    create_table :comments do |t|
      t.references :mood_update, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
