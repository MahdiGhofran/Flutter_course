//Difference between Hive and Floor : 

/*
Hive is a lightweight key-value(1*) database written in Dart for Flutter applications,
Floor is an object-oriented SQLite database wrapper for Flutter, inspired by Room, a similar library for Android.
*/

//1*: A key-value database, also known as a key-value store,
//    is a type of non-relational database that stores data as a collection of key-value pairs:
//    Key: A unique identifier for each item of data
//    Value: The data being identified or the location of that data
//    Key-value pair: A pairing of a key and its associated value

//https://hivedb.dev/#/

//start

/*
file "pubspec.yaml" :

```
dependencies:
  hive_flutter: ^[version]

dev_dependencies:
  hive_generator: ^[version]
  build_runner: ^[version]
```

*/

//Initialize
/*
Initializes Hive with a valid directory in your app files. 
You can also provide a subdirectory:

```await Hive.initFlutter();```


*/

//BOX

/*
All of your data is stored in boxes.

```var box = await Hive.openBox('testBox');```

You may call ```box('testBox')``` to get the singleton instance of an already opened box.
*/

//what are boxes 

/*

All data stored in Hive is organized in boxes.
A box can be compared to a table in SQL, but it does not have a structure and can contain anything.

For a small app, a single box might be enough. 
For more advanced problems, boxes are a great way to organize your data.
Boxes can also be encrypted to store sensitive data.

*/

//open boxes:

/*

Before you can use a box, you have to open it. 
For regular boxes, this loads all of its data from the local storage into memory for immediate access.
\Data persistence\Hive\imgDOC\Screenshot 2024-11-11 123911.png
```
var box = await Hive.openBox<E>('testBox');
```

If the box is already open, it is returned immediately and all supplied parameters are ignored.
Once you obtained a box instance, you can read, write, and delete entries.

*/

//get open box:
/*
Hive stores a reference to all open boxes. 
If you want to get an already opened box, you can use:
```
var box = Hive.box('myBox');
```
This method is especially useful for Flutter apps because you don't need to pass the box between widgets.
*/

//close box
/*
If you don't need a box again, you should close it. 
All cached keys and values of the box will be dropped from memory and the box file is closed after all active read and write operations finished.

It is perfectly fine to leave a box open for the runtime of the app. If you need a box again in the future, just leave it open.
```
var box = await Hive.openBox('myBox');
await box.put('hello', 'world');
await box.close();

```
Before your application exits, you should call ```Hive.close()``` to close all open boxes. 
Don't worry if the app is killed before you close Hive, it doesn't matter

*/

//Type parameter: Box<E>
/*

When you open a box, you can specify that it may only contain values of a specific type. 
For example a user box could be opened like this:
```
var box = await Hive.openBox<User>('users');

box.add(User());

box.add(5); // Compile time error

```
This box can also contain subtypes of ```User```.

It is important that you provide the same type parameter to ```Hive.box()```. 
You cannot open the same box multiple times with different type parameters.

```
await Hive.openBox<User>('users');

Hive.box<User>('users'); // OK

Hive.box('users'); // ERROR
Hive.box<Dog>('users'); // ERROR

```

*/


//Read and write :
/*
Read:
Reading from a box is very straightforward:
```
var box = Hive.box('myBox');

String name = box.get('name');

DateTime birthday = box.get('birthday');
```
If the key does not exist, null is returned. 
Optionally you can specify a defaultValue that is returned in case the key does not exist.

Write:
Writing to a box is almost like writing to a map. 
All keys have to be ASCII Strings with a max length of 255 chars or unsigned 32 bit integers.

```
var box = Hive.box('myBox');

box.put('name', 'Paul');

box.put('friends', ['Dave', 'Simon', 'Lisa']);

box.put(123, 'test');

box.putAll({'key1': 'value1', 42: 'life'})
```
*/

// Hive in flutter

/*
The hive_flutter package provides the Hive.initFlutter() extension method which handles everything for you.

Before you can open a box, Hive needs to know where it can store its data. 
Android and iOS have very strict rules for allowed directories. 
You can use the path_provider package to get a valid directory.

*/

//adapter -> نوع داده خاص ما مثلا تسک یا نوت رو به دیتا بیس میفهمونه 
/*
Hive supports all primitive types, List, Map, DateTime and Uint8List. 
If you want to store other objects, 
you have to register a TypeAdapter which converts the object from and to binary form.

You can either write a TypeAdapter yourself or generate it. 
Most of the time the generated adapter will perform really good. 
Sometimes there are small things you can improve with a manually written adapter.
```
Hive.registerAdapter(MyObjectAdapter());
https://hivedb.dev/#/custom-objects/create_adapter_manually
```
Make sure to use typeIds consistently. 
Your changes have to be compatible to previous versions of the box.
*/
//hive object


/*
When you store custom objects in Hive you can extend HiveObject to manage your objects easily.
HiveObject provides the key of your object and useful helper methods like ```save()``` or ```delete()```.
```
@HiveType(typeId: 0)
class TaskEntity extends HiveObject {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  bool isCompleted = false;
  @HiveField(2)
  Priority priority = Priority.low;
}
```
*/

//https://hivedb.dev/#/tutorials/dark_mode_switch
//https://hivedb.dev/#/tutorials/favorite_books?id=source-code-amp-live-test