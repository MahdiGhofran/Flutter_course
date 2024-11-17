import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/data.dart';

const noteboxname = 'notes';
void main() async {
  //since we use await we have to define like asynch
  await Hive.initFlutter(); //first line for initializing Hive
  Hive.registerAdapter(
      NoteAdapter()); //نوع داده ای که با اداپتور ساختیم رو اینجا تعریف میکنیم
  Hive.registerAdapter(PriorityAdapter());
  await Hive.openBox<Note>(noteboxname); //باز کردن باکس نوت
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Note>(noteboxname);
    return Scaffold(
      appBar: AppBar(
        title: Text('My notes'),
      ),
      //https://m2.material.io/components/buttons-floating-action-button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteScreen())); //رفتن به صفحه مطلوب
        },
        label: Text('Add New Note'),
      ),
      body: ValueListenableBuilder<Box<Note>>(
        valueListenable:
            box.listenable(), //اینجا تعریف کردیم بیا به باکسمون گوش بده
        builder: (context, box, child) {
          return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                final Note note = box.values.toList()[
                    index]; //تبدیل ایتریبل به لیست برای دسترسی با استفاده از ایندکس
                return Container(
                  child: Text(
                    note.write,
                    style: TextStyle(fontSize: 25),
                  ),
                );
              });
        },
      ),
    );
  }
}

class NoteScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  //NoteScreen({Key? key}) : super(key: key); // کلید برای اینده که باکس نوت رو بخوام ادیت کنم

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your Note'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final note = Note();
          note.head = _controller.text;
          note.write = _controller.text;
          note.priority = Priority.low;

          if (note.isInBox) {
            note.save(); //فقط برای به روز رسانی
          } else {
            final Box<Note> box =
                Hive.box(noteboxname); //اگر چیزی سیو نبود بیا این باکس رو بگیر
            box.add(note);
          }
          Navigator.of(context).pop(); // بستن صفحه
        },
        label: Text('Save It'),
      ),
      body: Padding(
        // فاصله از لبه ها
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller:
                  _controller, // هرگز نشه فراموش. استفاده از text editing controller
              decoration: InputDecoration(labelText: 'Write your note INJA...'),
            ),
          ],
        ),
      ),
    );
  }
}
