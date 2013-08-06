Meteor.startup(function () {
  if (Classes.find().count() === 0) {
      Classes.insert({day: "Monday", title: "HURR DURR 101", teacher: "some dude1" });
      Classes.insert({day: "Monday", title: "HURR DURR 102", teacher: "some dude2" });
      Classes.insert({day: "Tuesday", title: "HURR DURR 103", teacher: "some dude3" });
  }
}
);