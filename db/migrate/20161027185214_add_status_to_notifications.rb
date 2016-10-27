class AddStatusToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :status, :boolean, default: 1
  end
end
