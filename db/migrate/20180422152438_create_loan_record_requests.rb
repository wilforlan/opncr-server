class CreateLoanRecordRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_record_requests do |t|
      t.integer :user_id
      t.integer :validity, default: 2
      t.integer :initiator_id
      t.text :outstandings, :text, array: true, default: []
      t.boolean :invalidate, default: false

      t.timestamps
    end
  end
end
