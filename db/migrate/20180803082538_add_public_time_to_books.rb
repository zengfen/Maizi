class AddPublicTimeToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publick_time, :datetime
  end
end
