Schedule.DaysRoute = Ember.Route.extend
  model: ->
    Schedule.Day.find();