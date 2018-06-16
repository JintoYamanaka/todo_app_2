class AddFlagToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :flag, :int, default:0
    add_column :tasks, :user_id, :int
  end
end
