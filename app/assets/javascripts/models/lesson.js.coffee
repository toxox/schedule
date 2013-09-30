Schedule.Lesson = DS.Model.extend
  title: DS.attr 'string'
  teacher: DS.attr 'string'
  time: DS.attr 'string'
  location: DS.attr 'string'
  day: DS.belongsTo 'Schedule.Day'

  becameInvalid: ->
    location.reload false
