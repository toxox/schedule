Schedule.Router.map(function () {
  this.resource('days', function () {
    this.resource('day', {path: ':day_id'});
  });
});