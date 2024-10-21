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