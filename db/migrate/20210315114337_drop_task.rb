class DropTask < ActiveRecord::Migration[6.0]
  def up
    connection.execute 'drop table if exists task'
  end
end
