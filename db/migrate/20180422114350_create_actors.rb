class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :address
      t.string :signing_key

      t.timestamps
    end
  end
end
