void main() {
  print("hello");

  //boolean
  bool isTrue = true;
  bool isFalse = false;
  print("Dart is really fun to learn $isTrue, also Python : $isFalse");

  //Lists
  List<int> numbers = [1,2,34,5,6];
  print(numbers);

  //sets
  Set<String> fruits = {'apple','mango'};
  print(fruits);

  //Maps
  Map<String, dynamic> person = {
    'name':'Tim',
    'age':30,
    'isStudent':false,
  };
  print(person);

  var laugh_symbol = '\u{1f600}';
  print(laugh_symbol);

// initialize the set

  var mySet = <String> {};

  mySet.add('Frutis');
  mySet.add('Animals');
  mySet.add('Humans');
  print(mySet);
  print(mySet.contains('banana'));
  mySet.remove('Animals');
  print(mySet);

  // initialize the map

  var myMap = <String, int> {};
  myMap['apple'] = 6;
  myMap['Mango'] = 60;
  myMap['Pineapple'] = 33;

  print(myMap);

  print(myMap['Pineapple']);
  myMap.remove('apple');
  print(myMap);

  //Anonymous function

  var listexample = ["James","patrick","Mathew"];
  print('Example for an anonymous function');
  listexample.forEach((element) {
    print('${listexample.indexOf(element)}: $element');
  });
  var multiple = (int a, int b) => a * b;
  var result = multiple(5,3);
  print(result);




//Runes (for representing Unicode characters)
  Runes unicodeHeart = Runes('\u2665');
  print(String.fromCharCodes(unicodeHeart));

//var
  var greeting = 'Hello Dart';
  var numberwithar = 3.14;
  int test;
// print(test);

  var list2 =List<int>.filled(7, 0);
  print(list2);
  list2[1]= 10;
  print(list2);



}