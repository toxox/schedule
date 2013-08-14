class DaySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :lessons
  embed :ids, include: true
end
