class ClockSerializer < ActiveModel::Serializer
  attributes :id, :is_bedtime, :user_id, :created_at
end
