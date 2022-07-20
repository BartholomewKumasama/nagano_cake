class AddColumnsToCustomers < ActiveRecord::Migration[6.1]
  def change
    
     add_column :customers, :family_name,       :string,  null: false                 ##名
     add_column :customers, :first_name,        :string,  null: false                 ##姓
     add_column :customers, :family_name_kana,  :string,  null: false                 ##名カナ
     add_column :customers, :first_name_kana,   :string,  null: false                 ##姓カナ
     add_column :customers, :postal_code,       :string,  null: false                 ##郵便番号
     add_column :customers, :address,           :string,  null: false                 ##住所
     add_column :customers, :telephone_number,  :string,  null: false                 ##電話番号
     add_column :customers, :is_deleted,        :boolean, null: false, default: false ##退会フラグ
     
  end
end
