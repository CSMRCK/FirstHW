import 'dart:io';
import 'package:args/args.dart';

enum DayOfTheWeek {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

abstract class Basis {
  void sayHello();
}

class Task extends Basis {
  int id;
  String name;
  int category;
  static var listing = [1, 2, 3, 4, 5];
  var listingMy = [-2, -1, 0, ...listing];
  static final categoryList = <int, String>{
    1: 'home',
    2: 'work',
    3: 'general',
    4: 'shopping'
  };
  int dayIndex;
  List<String> day = [
    for (DayOfTheWeek day in DayOfTheWeek.values)
      '${day.toString().substring(day.toString().indexOf('.') + 1)}'
  ];

  static void categoryAllCategories() {
    print('The full list of categories: ');
    for (var item in categoryList.values) {
      print(item);
    }
  }

  void currentCategoryInfo() {
    print('Current category is: ${categoryList[category]}');
  }

  Task({this.id, this.name, this.category, this.dayIndex});

  @override
  void sayHello() {
    print("Hello");
  }

  @override
  String toString() =>
      'Your Task consits of: $name, ${categoryList[category]}, ${day[dayIndex]}';
}

class ToDoList extends Task {
  Map<int, Task> tasks = {};

  ToDoList({Task obj}) {
    tasks[obj.id] = obj;
  }

  void addOne(Task obj) {
    tasks.putIfAbsent(obj.id, () => obj);
  }

  void addFew(List params) {
    params.forEach((element) => tasks.putIfAbsent(element.id, () => element));
    print('Tasks have been added successfully!');
  }

  void showTaskList() {
    tasks.forEach((k, v) => print('${k} - ${v}'));
  }

  void Remove(int key) {
    if (tasks.containsKey(key)) {
      tasks.remove(key);
    } else {
      print('No task was found with this id!');
    }
  }

  void showCategoryStats() {
    print(
        'Where 1:home, 2:work, 3: general, 4: shopping, and second nubmer is count');
    var map = Map();
    if (tasks.isNotEmpty) {
      tasks.forEach((v, x) => map[x.category] =
          !map.containsKey(x.category) ? (1) : (map[x.category] + 1));
      print(map);
    }
  }
}

ArgResults argResults;
void main(List<String> arguments) {
  // Task first = Task(id: 1, name: "Create API", category: 2, dayIndex: 3);
  // Task firstLst = Task(id: 2, name: "Create APIv2", category: 2, dayIndex: 3);
  // Task firstLsta = Task(id: 3, name: "Create APIv3", category: 2, dayIndex: 3);
  // Task second = Task(id: 4, name: "Make a pie", category: 1, dayIndex: 5);
  // Task third = Task(id: 5, name: "Buy a new coat", category: 4, dayIndex: 1);

  // ToDoList tasks = ToDoList(obj: first);
  // tasks.addFew([firstLst, firstLsta, second, third]);
  // //tasks.showTaskList();
  // tasks.showCategoryStats();
  // tasks.Remove(4);
  // tasks.showTaskList();
  // tasks.showCategoryStats();

  print('How many instance of task do you want to create: ');
  var number = int.parse(stdin.readLineSync());
  Task first = Task(id: 99, name: 'Susp', category: 2, dayIndex: 3);
  ToDoList tasks = ToDoList(obj: first);

  for (var i = 1; i <= number; i++) {
    var id = int.parse(stdin.readLineSync());
    var name = stdin.readLineSync();
    var category = int.parse(stdin.readLineSync());
    var dayIndex = int.parse(stdin.readLineSync());

    var obj = Task(id: id, name: name, category: category, dayIndex: dayIndex);
    tasks.addOne(obj);
  }
  tasks.showTaskList();
  print('for commit');
  print('last commit');
  print('last commit');
  print('last commit');
}
