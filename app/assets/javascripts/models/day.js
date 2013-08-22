Schedule.Day = DS.Model.extend({
  name: DS.attr('string'),
  lessons: DS.hasMany('Schedule.Lesson')
});
