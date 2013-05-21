class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :domain
      t.string :email
      t.string :image
      t.string :first_name
      t.string :last_name
      t.string :full_name
    end
  end
end
