class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :book_name, presence: true
      t.decimal :price, precision: 2, scala: 6

      t.timestamps
    end
  end
end
