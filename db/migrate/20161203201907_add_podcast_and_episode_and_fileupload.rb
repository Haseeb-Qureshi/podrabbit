class AddPodcastAndEpisodeAndFileupload < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.integer :client_id, index: true
      t.integer :producer_id, index: true
      t.string :name, null: false
      t.timestamps
    end

    create_table :episodes do |t|
      t.references :podcast
      t.string :status, null: false
      t.string :name, null: false
      t.timestamps
    end

    create_table :file_uploads do |t|
      t.references :episode
      t.string :name
      t.text :url
      t.timestamps
    end
  end
end
