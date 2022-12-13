class RemoveOrganizerFromDraw < ActiveRecord::Migration[7.0]
  def change
    remove_column :draws, :organizer, :string
  end
end
