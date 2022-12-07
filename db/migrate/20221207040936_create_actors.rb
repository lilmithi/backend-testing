class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string "actor_name"
      t.string "sex"
      t.string "actor_image"
      t.timestamps
    end
  end
end
