class RevertNonNullDeliveryTypeId < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:delivery_options, :delivery_type_id, true)
  end
end