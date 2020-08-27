class AddReleaseDateToProductions < ActiveRecord::Migration[5.2]
  def change
    add_column :productions, :release_date, :string
  end
end
