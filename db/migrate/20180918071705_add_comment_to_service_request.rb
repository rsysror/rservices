class AddCommentToServiceRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :service_requests, :comment, :text
  end
end
