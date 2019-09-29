class RemoveSIntroductionFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :s_introduction, :text
  end
end
