Schedule.LessonController = Ember.ObjectController.extend
  isEditing: false

  edit: ->
    @set "isEditing", true

  doneEditing: ->
    @set "isEditing", false
    @get("store").commit()

  cancel: ->
    @get("model.transaction").rollback()
    @set "isEditing", false

  delete: ->
    if window.confirm("Are you sure?")
      @get("content").deleteRecord()
      @get("store").commit()