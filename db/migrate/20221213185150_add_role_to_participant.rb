class AddRoleToParticipant < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :role, :string
  end
end
