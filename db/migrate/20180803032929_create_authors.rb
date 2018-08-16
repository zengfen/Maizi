class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name, presence: true
      t.string :no

      t.timestamps
    end
  end
end
