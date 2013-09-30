class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :teacher, :time, :location, :day_id
end
