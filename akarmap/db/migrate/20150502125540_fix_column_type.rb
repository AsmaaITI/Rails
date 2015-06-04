class FixColumnType < ActiveRecord::Migration
  def change
	rename_column :advertises, :type, :mytype
  end
end
