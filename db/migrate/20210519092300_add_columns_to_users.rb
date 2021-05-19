class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :genre_id, :integer
    add_column :products, :name, :string
    add_column :products, :description, :text
    add_column :products, :image_id, :string
    add_column :products, :sale_status, :boolean
    add_column :products, :price, :integer
    
    add_column :orders, :customer_id, :integer
    add_column :orders, :postal_code, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :shipping_cost, :integer
    add_column :orders, :total_payment, :integer
    add_column :orders, :payment_method, :integer
    add_column :orders, :status, :integer
    
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :text
    add_column :customers, :email, :string
    add_column :customers, :encrypted_password, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :is_deleted, :boolean
    
    add_column :addresses, :customer_id, :integer
    add_column :addresses, :address, :string
    add_column :addresses, :postal_code, :string
    add_column :addresses, :name, :string
    
    add_column :genres, :name, :string
    
    add_column :cart_items, :customer_id, :integer
    add_column :cart_items, :product_id, :integer
    add_column :cart_items, :amount, :integer
    
    add_column :order_items, :order_id, :integer
    add_column :order_items, :product_id, :integer
    add_column :order_items, :production_status, :integer
    add_column :order_items, :amount, :integer
    add_column :order_items, :price, :integer
    
  end
end
