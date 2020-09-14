class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.decimal :monthly_cost
      t.references :owner
      t.references :pet_type

      t.timestamps
    end
  end
end
