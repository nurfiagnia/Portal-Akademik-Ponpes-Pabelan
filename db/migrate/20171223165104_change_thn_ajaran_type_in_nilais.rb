class ChangeThnAjaranTypeInNilais < ActiveRecord::Migration[5.1]
  def change
  	change_column :nilais, :thn_ajaran, :string
  end
end
