// #= require ./store
// #= require_tree ./models
// #= require_tree ./controllers
// #= require_tree ./views
// #= require_tree ./helpers
// #= require_tree ./templates
// #= require_tree ./routes
// #= require ./router
// #= require_self

//Router
Schedule.Router.map(function () {
  this.resource('days', function () {
    this.resource('day', {path: ':day_id'});
  });
});

Schedule.DaysRoute = Ember.Route.extend({
  model: function () {
    return Schedule.Day.find();
  }
});

Schedule.DayController = Ember.ObjectController.extend();

Schedule.LessonController = Ember.ObjectController.extend({
  isEditing: false,

  edit: function () {
    this.set('isEditing', true);
  },

  doneEditing: function () {
    this.set('isEditing', false);
  }
});

//Model
Schedule.Store = DS.Store.extend({
  revision: 12,
  adapter: 'DS.FixtureAdapter'
});

Schedule.Day = DS.Model.extend({
  name: DS.attr('string'),
  lessons: DS.hasMany('Schedule.Lesson')
});

Schedule.Lesson = DS.Model.extend({
  title: DS.attr('string')
});

Schedule.Day.FIXTURES = [
  {id:1, name: "Monday", lessons: [101, 102]},
  {id:2, name: "Tuesday", lessons: [103]},
  {id:3, name: "Wednesday", lessons: []}
]

Schedule.Lesson.FIXTURES = [
  {id: 101, title: "hurr durr 101"},
  {id: 102, title: "hurr durr 102"},
  {id: 103, title: "hurr durr 103"},
]
