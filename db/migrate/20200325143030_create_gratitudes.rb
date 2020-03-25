class CreateGratitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :gratitudes do |t|
      t.string :title
      t.datetime :date
      t.text :content
      t.belong_to :user

      t.timestamps
    end
  end
end
