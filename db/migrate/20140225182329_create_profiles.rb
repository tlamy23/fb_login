class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date :born_date
      t.string :photo

      t.timestamps
    end
  end
end
