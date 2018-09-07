class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
    	t.text :description
    	t.integer :rating
      t.integer :user_id
      t.integer :portfolio_id
      t.integer :service_request_id 
      t.timestamps
    end
  end
end
