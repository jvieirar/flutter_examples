class Person {
  String name = 'Max';
  int age = 30;

  void greet() {
    // string interpolation available
//     print ('Hi, I am ' + name + ' and I am ' + age.toString() + ' years old!');
    print('Hi, I am ${name} and I am ${age} years old!');
  }
}

class Car {
  // properties
  String color = 'Red', name, brand = 'Mazda';
  var _kilometers = 0;

  // constructors
  // override default constructor
//   Car(String name) {
//     this.name = name;
//   }
  Car(this.name);

  // custom constructor
  Car.colorAndBrand(this.name, this.color, this.brand);

  // methods
  void driving() {
    print('${this.color} ${this.name} is driving');
    this._kilometers += 100;
  }

  int getKilometers() {
    return this._kilometers;
  }
}

int addNumbers(int a, int b) {
  return a + b;
}

void imAnArrow() => print("I'm an arrow");

// named params
String timeFormat({int hour, int minute, int second}) {
  var h = leadingZero(hour);
  var m = leadingZero(minute);
  var s = leadingZero(second);
  return '$h:$m:$s';
}

String leadingZero(int n) => n < 10 ? '0$n' : n.toString();

void main() {
  // need toString() to add numbers with strings
//   print('Sum: ' + addNumbers(1, 2).toString());
  print('Sum: ${addNumbers(1, 2)}');

  // using var is a good practice when you know the result, powerful type inference
  var sum15 = addNumbers(10, 5);
  print(sum15);

  // shorthand for functions with only one expression
  imAnArrow();

  // named params
  print(timeFormat(minute: 24, hour: 5, second: 7));

  // objects
  // don't need new keyword
  var p1 = Person();
  var p2 = Person();
  // class arguments are properties (get and set by default)
  p2.name = 'Juan';
  p2.age = 29;
  print(p1.name);
  print(p2.name);
  p1.greet();

  // car
  var c1 = Car('Golfo');
  var c2 = Car.colorAndBrand('Sporty', 'Yellow', 'BMW');
  c1.driving();
  c2.driving();
  print(c1._kilometers);

  // lists
  var list = [1, 2, 3];
  // null-aware spread operator with ?
  var list2 = [0, ...?list];
  assert(list2.length == 4);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var n in listOfInts) '#$n'];
  print(listOfStrings);

  // sets
  var halogens = {'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
  // var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.
  var elements = <String>{};
  elements.add('fluorine');
  elements.add('fluorine');
  elements.addAll(halogens);
  print(elements);

  // maps
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  // or Map constructor
//   var gifts = Map();
//   gifts['first'] = 'partridge';
//   gifts['second'] = 'turtledoves';
//   gifts['fifth'] = 'golden rings';

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // runes
//   import 'package:characters/characters.dart';
  var hi = 'Hi 🇩🇰';
  print(hi);
//   print('The end of the string: ${hi.substring(hi.length - 1)}');
//   print('The last character: ${hi.characters.last}\n');
}
