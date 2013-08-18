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

Schedule.DayController = Ember.ObjectController.extend({
  isAdding: false,

  add: function () {
    this.set('isAdding', true)
  },

  addLesson: function () {
    this.get('model.lessons').createRecord({
      title: this.get('title'),
      teacher: this.get('teacher'),
      time: this.get('time')
    });
    this.setProperties({'title': '', 'teacher': '', 'time': ''});
    this.set('isAdding', false);
    this.get("model.transaction").commit();
  }
});

Schedule.LessonController = Ember.ObjectController.extend({
  isEditing: false,

  edit: function () {
    this.set('isEditing', true);
  },

  doneEditing: function () {
    this.set('isEditing', false);
    this.get('store').commit();
  },

  delete: function () {
    if (window.confirm("Are you sure?")) {
      this.get('content').deleteRecord();
      this.get('store').commit();
    };
  }
});

//Model
Schedule.Store = DS.Store.extend({
  revision: 12,
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