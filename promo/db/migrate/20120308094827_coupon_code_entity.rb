class CouponCodeEntity < ActiveRecord::Migration
  def up
    create_table :spree_coupon_codes do |t|
      t.string :number, :null => false, :limit => 15
      t.references :activator
      t.integer :usage_limit
      t.datetime :expires_at
      t.timestamps
    end

    add_index :spree_coupon_codes, [:number], :name => "index_coupon_codes_on_number"

    remove_column :spree_activators, :code
  end
  def down
    drop_table :spree_coupon_codes

    add_column :spree_activators, :code, :string
  end
end
