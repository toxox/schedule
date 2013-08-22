Schedule.DayController = Ember.ObjectController.extend({
  lessons: (function () {
    return Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, {
      sortProperties: ["time"],
      content: this.get('content.lessons')
    });
  }).property('content.lessons'),

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
  },

  cancel: function () {
    this.setProperties({'title': '', 'teacher': '', 'time': ''});
    this.set('isAdding', false);
  }
});