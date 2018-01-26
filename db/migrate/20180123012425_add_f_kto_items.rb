class AddFKtoItems < ActiveRecord::Migration[5.1]
  def change
    # add_reference :items, :merchant, index: true, foreign_key: true

  end
end
