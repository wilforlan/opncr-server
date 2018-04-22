class LoanRecordRequestSerializer < ActiveModel::Serializer
  attributes  :id,
              :initiator_info,
              :outstandings,
              :invalidate,
              :created_at


  def initiator_info
    initiator = object.initiator
    return {} unless initiator
    return {
      present: true,
      address: initiator.address,
    }
  end
end
