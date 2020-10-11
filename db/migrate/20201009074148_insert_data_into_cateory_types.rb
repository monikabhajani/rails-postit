class InsertDataIntoCateoryTypes < ActiveRecord::Migration[5.1]
  def change
  	execute("insert into category_types (category_name, created_at, updated_at) values ('Education', 'NOW', 'NOW');")
  	execute("insert into category_types (category_name, created_at, updated_at) values ('Business', 'NOW', 'NOW');")
  	execute("insert into category_types (category_name, created_at, updated_at) values ('Teaching', 'NOW', 'NOW');")
  end
end
