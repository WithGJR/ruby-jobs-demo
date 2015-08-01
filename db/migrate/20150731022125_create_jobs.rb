class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.integer :occupation, default: 0
      t.integer :job_type, default: 0
      t.string :location
      t.string :url
      t.text :description
      t.text :apply_information
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
