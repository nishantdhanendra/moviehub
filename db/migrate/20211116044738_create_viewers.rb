class CreateViewers < ActiveRecord::Migration[6.0]
  def change
    create_table :viewers do |t|
      t.string :movie_id

      t.timestamps
    end
  end
end
