class ActorSerializer < ActiveModel::Serializer
  attributes  :id,
              :signing_key,
              :name
end
