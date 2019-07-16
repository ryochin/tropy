class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries, id: :string do |t|
      t.text :content, null: false

      t.timestamps null: false
      t.integer :lock_version, unsigned: true, null: false, default: 0
    end

    add_index :entries, :id, unique: true
  end
end
