class CreateUserFollowers < ActiveRecord::Migration[7.1]
  def change
    create_table :user_followers do |t|
      t.references :follower, foreign_key: { to_table: :users } #who is following
      t.references :followed, foreign_key: { to_table: :users } # who is getting followed

      t.timestamps
    end
  end
end
