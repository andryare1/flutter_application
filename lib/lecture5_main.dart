import 'dart:async';

void main() {
//recordsExample();
//asyncExample();

//runApp(const FuturePage());

//streamExample();

  //runApp(const StreamPage());
  generatorExample();
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
