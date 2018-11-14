class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :user_cash
      # t.integer :owner_departure  # can remove this from here and strongparams + remigrate      
      t.string :password_digest

      t.timestamps
    end
  end
end
