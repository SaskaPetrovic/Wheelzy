class RenameBookingsToRentings < ActiveRecord::Migration[7.0]
  def change
    rename_table :bookings, :rentings
  end
end
