class AddUidToFans < ActiveRecord::Migration[6.0]
  def change
    add_column(:fans, :uid, :string)
  end
end
