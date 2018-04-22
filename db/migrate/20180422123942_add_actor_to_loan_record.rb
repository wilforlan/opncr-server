class AddActorToLoanRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :loan_records, :actor_id, :integer
  end
end
