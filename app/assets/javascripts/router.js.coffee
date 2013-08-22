Schedule.Router.map ->
  @resource "days", ->
    @resource "day",
      path: ":day_id"
