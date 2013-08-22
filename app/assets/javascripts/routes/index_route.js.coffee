Schedule.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'days'