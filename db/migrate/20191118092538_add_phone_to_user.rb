class AddPhoneToUser < ActiveRecord::Migration[6.0]
  def change
    add_column(:users,:phone,:int)
  end
end
