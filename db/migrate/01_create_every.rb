class CreateEvery < ActiveRecord::Migration[4.2]
  def change
    create_table :figures do |t|
      t.string :name
    end

    create_table :landmarks do |t|
      t.string :name
      t.integer :year_completed
      t.belongs_to :figure
    end

    create_table :titles do |t|
      t.string :name
    end

    create_table :figure_titles do |t|
      t.belongs_to :figure
      t.belongs_to :title
    end


  end
end
