class ChangeCommenterIdToName < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :commenter_id, :text
    rename_column :comments, :commenter_id, :commenter_name
  end
end
