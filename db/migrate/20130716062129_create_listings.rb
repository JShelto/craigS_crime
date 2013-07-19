class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.date  :date
      t.text  :url
      t.integer  :neighborhood_id
      t.timestamps
    end
  end
end
