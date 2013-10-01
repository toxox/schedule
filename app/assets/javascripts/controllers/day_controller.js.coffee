Schedule.DayController = Ember.ObjectController.extend
  lessons: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      sortProperties: ["time"]
      content: @get("content.lessons")

  ).property("content.lessons")

  isAdding: false

  add: ->
    @set "isAdding", true

  clear_fields: ->
    @setProperties
      title: ""
      teacher: ""
      time: ""
      location: ""
    @set "isAdding", false

  addLesson: ->
    @get("model.lessons").createRecord
      title: @get("title")
      teacher: @get("teacher")
      time: @get("time")
      location: @get("location")

    @clear_fields()
    @get("model.transaction").commit()

  cancel: ->
    @clear_fields()
