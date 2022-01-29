class CreateJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylists do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
      t.timestamps
    end
    add_index :jwt_denylist, :jti
  end
end
