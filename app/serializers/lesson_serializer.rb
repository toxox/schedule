class LessonSerializer < ActiveModel::Serializer
  attributes :title, :teacher, :time
end