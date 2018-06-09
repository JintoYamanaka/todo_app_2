class AddFlagToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :flag, :int, default:0
  end
end
