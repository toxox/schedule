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
  revision: 13,
  adapter: 'DS.RESTAdapter'
});

Schedule.Day = DS.Model.extend({
  name: DS.attr('string'),
  lessons: DS.hasMany('Schedule.Lesson')
});

Schedule.Lesson = DS.Model.extend({
  title: DS.attr('string'),
  teacher: DS.attr('string'),
  time: DS.attr('string'),
  day: DS.belongsTo('Schedule.Day')
});
