class AddEmailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column(:users,:email,:string)
  end
end
