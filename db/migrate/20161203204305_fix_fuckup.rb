class FixFuckup < ActiveRecord::Migration
  def change
    remove_column :podcasts, :producer_id
    add_column :episodes, :producer_id, :integer, index: true
  end
end
