class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|

      t.references :user
      t.string :content
      
      t.timestamps
    end
  end
end
