namespace :db do

    task populate_sample_loans: :environment do
      arr = [
        { id: 1, user_id: 1, actor_id: 1, content: "100,000"},
        { id: 2, user_id: 1, actor_id: 1, content: "150,000"},
        { id: 3, user_id: 1, actor_id: 1, content: "120,000"},
      ]

      arr.each do |obj|
        already_created = LoanRecord.find_by(id: obj[:id])
        if already_created
          already_created.update!(obj)
        else
            LoanRecord.create!(obj)
        end
      end
    end

  end
