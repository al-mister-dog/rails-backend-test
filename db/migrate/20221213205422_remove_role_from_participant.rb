class RemoveRoleFromParticipant < ActiveRecord::Migration[7.0]
  def change
    remove_column :participants, :role, :string
  end
end
