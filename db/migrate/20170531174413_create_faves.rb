class CreateFaves < ActiveRecord::Migration[5.0]
  def change
    create_table :faves do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :faves_count

      t.timestamps
    end
  end
end
