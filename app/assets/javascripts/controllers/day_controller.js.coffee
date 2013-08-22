Schedule.DayController = Ember.ObjectController.extend
  lessons: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      sortProperties: ["time"]
      content: @get("content.lessons")

  ).property("content.lessons")

  isAdding: false

  add: ->
    @set "isAdding", true

  addLesson: ->
    @get("model.lessons").createRecord
      title: @get("title")
      teacher: @get("teacher")
      time: @get("time")

    @setProperties
      title: ""
      teacher: ""
      time: ""

    @set "isAdding", false
    @get("model.transaction").commit()

  cancel: ->
    @setProperties
      title: ""
      teacher: ""
      time: ""

    @set "isAdding", false