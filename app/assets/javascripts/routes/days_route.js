Schedule.DaysRoute = Ember.Route.extend({
  model: function () {
    return Schedule.Day.find();
  }
});