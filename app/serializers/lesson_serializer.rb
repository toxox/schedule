class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :teacher, :time, :day_id
end
