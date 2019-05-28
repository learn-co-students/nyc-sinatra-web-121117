class CreateTitelFigureAndJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :figures do |t|
      t.string :name
    end

    create_table :titles do |t|
      t.string :name
    end

    create_table :title_figures do |t|
      t.belongs_to :title
      t.belongs_to :figure
    end
  end
end
