class Lesson < ActiveRecord::Base
  belongs_to :day
  validates :title, presence: true, length: { maximum: 20 }
  validates :teacher, presence: true, length: { maximum: 20 }
  validates :time, presence: true, format: { with: /\d\d:\d\d/ }
end
