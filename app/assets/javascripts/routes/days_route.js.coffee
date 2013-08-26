Schedule.DaysRoute = Ember.Route.extend
  model: ->
    Schedule.Day.find()

  activate: ->
    document.title = "IF-31g Schedule"

