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

  checkFields: ->
    title = if @get("title") then @get("title").length <= 20 else false
    teacher = if @get("teacher") then @get("teacher").length <= 20 else false
    time = if @get("time") then @get("time").match(/\d\d:\d\d/) else false
    location = if @get("location") then @get("location").length <= 15 else false

    title and teacher and location and time

  addLesson: ->
    if @checkFields()
      @get("model.lessons").createRecord
        title: @get("title")
        teacher: @get("teacher")
        time: @get("time")
        location: @get("location")
    else
      console.log "Record was not saved"

    @clear_fields()
    @get("model.transaction").commit()

  cancel: ->
    @clear_fields()
