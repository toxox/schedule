Schedule.LessonController = Ember.ObjectController.extend({
  isEditing: false,

  edit: function () {
    this.set('isEditing', true);
  },

  doneEditing: function () {
    this.set('isEditing', false);
    this.get('store').commit();
  },

  cancel: function () {
    this.get('model.transaction').rollback();
    this.set('isEditing', false);
  },

  delete: function () {
    if (window.confirm("Are you sure?")) {
      this.get('content').deleteRecord();
      this.get('store').commit();
    };
  }
});