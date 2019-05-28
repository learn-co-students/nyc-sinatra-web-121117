class CreateLandmarks < ActiveRecord::Migration[4.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.belongs_to :figure
      t.integer :year_completed
    end
  end
end
