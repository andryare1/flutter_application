import 'dart:async';

void main() {
//recordsExample();
//asyncExample();

//runApp(const FuturePage());

//streamExample();

  //runApp(const StreamPage());
  //generatorExample();
}

void recordsExample() {
  var item = ('Андрей', 19);

  print(item.$1);

  (String, int, int) item2 = ('Дмитрий', 16, 1);
  print(item2);
  var item3 = (name: 'Илья', age: 18);
  print(item3);
}

void asyncExample() async {
  // final result  = await Future<String>(() async {
  //   return 'String';
  // });
  // print(result);

  // print('start main');
  // Future(() => print(1));
  // Future.microtask(() => print(2));
  // print('end main');
  asyncExercise();
}

void asyncExercise() {
  print('start main');

  Future(() => print('future1')).then((value) {
    print('then1');

    Future(() => print('nested future'));
  });

  Future.sync(() => print('future sync')).then((value) => print('then sync'));
  Future(() => print('future 2')).then((value) => print('then 2'));

  print('end main');
}

Future<void> cacl() async {
  print('calc');
}

void streamExample() async {
  var controller = StreamController<String>();
  final subscription = controller.stream.listen((event) {
    print(event);
  });

  await Future.delayed(const Duration(seconds: 1));
  controller.add('stream1');
  await Future.delayed(const Duration(seconds: 1));
  controller.add('stream2');
  await Future.delayed(const Duration(seconds: 1));

  subscription.cancel();
}

void generatorExample() async {
  //print(naturalsTo(5));
  asynchronousNAturalsTo(5).listen((event) => print(event));
}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;

  while (k < n) {
    yield k++;
  }
}

Stream<int> asynchronousNAturalsTo(int n) async* {
  int k = 0;

  while (k < n) {
    await Future.delayed(const Duration(seconds: 1));
    yield k++;
  }
}
void main() {
  //baseExample();
  //nullSafetyExample();
  //oopExample();
  //collectionsExample(); 
}

  void baseExample() {

     var countVar= 5;
     countVar++;

     print('countVar = ${countVar.runtimeType}');
     print('countVar = $countVar');

     final List<int> list = [];
     list.add(1);
     print(list);
  }

  void nullSafetyExample() {
    
    int? cc = 5;
    cc = null;


    Never valueIsNotDefined() {
      throw ArgumentError('value Is Not Defined');
    }

    int method(int? value) {
      if(value == null){
        return valueIsNotDefined();
      }
      return value;
    }
    method(null);
  }
 
 abstract class Person {
  final String name;
  final int age;
  final bool sex;

  Person({required this.name, required this.age, required this.sex});
 }

 class Student extends Person{
  final double avgScore;

  Student( {required this.avgScore, required super.name, required super.age, required super.sex});
 }

 class Man implements Person{
  @override
  final int age;
  @override
  final String name;
  Man({required this.age, required this.name});
  @override
  bool get sex => true;
 }

 extension ManExtension on Man{
  bool isOld(){
    if (age > 65) {
      return true;
    } else {
      return false;
    }
  }
 }
 
 void oopExample() {
Person p = Student(avgScore: 5.0, name: 'Andrey', age: 19, sex: true);

Man man = Man(age: 70, name: 'Andrey');
print(man.isOld());

 }

void collectionsExample() {
  final list = <int>[1,2,3];

  final list1 = List<String>.empty(growable: true);
  list1.add('1');
  print(list1);

  final map = {
    'key1' : 'value1',
    'key2' : 'value2',
  };

  print(map[ 'key1']);
}