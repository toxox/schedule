if (Meteor.isClient) {
  Classes = new Meteor.Collection("classes");

  Template.schedule.classes = function () {
    return Classes.find();
  };

  Template.newClassForm.events = {
    'click #submit': function (event, template) {
      event.preventDefault();

      var newClass = {
        day: template.find("#day").value,
        title: template.find("#title").value,
        teacher: template.find("#teacher").value,
      };
      Classes.insert(newClass);
    }
  };
}