
class People{
  var people = <Person>[
    Person(
        0,
        "Ivan",
        "Lat",
        "https://s.abcnews.com/images/GMA/191211_gma_thunberg1_hpMain_16x9_992.jpg",
        100, false),
    Person(1, "John", "Fout", "", 89, false),
    Person(
        2,
        "George",
        "Sopl",
        "https://assets.change.org/photos/0/kx/ah/hjkxAHxAKbytEHg-800x450-noPad.jpg?1560309500",
        70, false),
    Person(
        3,
        "George",
        "Sopl",
        "https://assets.change.org/photos/0/kx/ah/hjkxAHxAKbytEHg-800x450-noPad.jpg?1560309500",
        80, false),
    Person(
        4,
        "George",
        "Sopl",
        "https://assets.change.org/photos/0/kx/ah/hjkxAHxAKbytEHg-800x450-noPad.jpg?1560309500",
        50, false),
    Person(5, "George", "Sopl", "", 30, false),
    Person(
        6,
        "George",
        "Sopl",
        "https://assets.change.org/photos/0/kx/ah/hjkxAHxAKbytEHg-800x450-noPad.jpg?1560309500",
        90, false),
    Person(
        7,
        "George",
        "Sopl",
        "https://assets.change.org/photos/0/kx/ah/hjkxAHxAKbytEHg-800x450-noPad.jpg?1560309500",
        90, false)
  ];
}


class Person {
  Person(this.id, this.firstName, this.lastName, this.photo, this.progress, this.isAdded);

  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final double progress;
  bool isAdded;
}
