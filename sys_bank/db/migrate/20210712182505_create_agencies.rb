class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :num_agency
      t.string :adress

      t.timestamps
    end
  end
end
