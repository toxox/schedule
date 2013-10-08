Schedule.LessonController = Ember.ObjectController.extend
  isEditing: false

  edit: ->
    @set "isEditing", true

  checkFields: ->
    title = if @get("title") then @get("title").length <= 20 else false
    teacher = if @get("teacher") then @get("teacher").length <= 20 else false
    time = if @get("time") then @get("time").match(/\d\d:\d\d/) else false
    location = if @get("location") then @get("location").length <= 15 else false

    title and teacher and location and time

  doneEditing: ->
    if @checkFields()
      @get("store").commit()
    else
      @get("model.transaction").rollback()
      console.log "Record was not updated"

    @set "isEditing", false

  cancel: ->
    @get("model.transaction").rollback()
    @set "isEditing", false

  delete: ->
    if window.confirm("Are you sure?")
      @get("content").deleteRecord()
      @get("store").commit()