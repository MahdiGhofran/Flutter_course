/*
Floor provides a neat(شسته و رفته) SQLite abstraction(1*) for your Flutter applications inspired(الهام گرفته) by the Room persistence library(3*). 
It comes with automatic mapping between in-memory objects and database rows while still offering full control of the database with the use of SQL.
As a consequence, it's necessary to have an understanding of SQL and SQLite in order to harvest(برداشت) Floor's full potential.
*/

//1* : 
//Data abstraction is a logical function in an application to separate the raw data from the front end. 
//In simple terms, the data layer handles the connection to the database and querying(2*) it from the front end.

//2*:
//"querying" refers to the process of requesting specific data from the database. 
//When the data layer handles querying, it means that it is responsible for crafting and executing requests to retrieve, filter, update, or
//delete data stored in the database according to the needs of the application.

//3*:
//Room is a persistent library in Android that allows fluent access to the database by creating an abstract layer over SQLite. 
//It simplifies the process of adding a structured SQL database to your app. 
//It also makes it easier to define the database objects and access the app data faster by caching it.

/*
Getting Started 
1. Setup Dependencies 

Add the runtime dependency floor as well as the generator floor_generator to your "pubspec.yaml".
The third dependency is build_runner which has to be included as a dev dependency just like the generator.

floor -> holds all the code you are going to use in your application.
floor_generator -> includes the code for generating the database classes.
build_runner -> enables a concrete way of generating source code files.
*/

dependencies:
  flutter:
    sdk: flutter
  floor: ^1.4.2

dev_dependencies:
  floor_generator: ^1.4.2
  build_runner: ^2.1.2

/*
2.Create an Entity

It will represent a database table as well as the scaffold of your business object. 
@entity marks the class as a persistent(ماندگار) class. 
It's required to add a primary key to your table. 
You can do so by adding the @primaryKey annotation to an int property(4*). 
There is no restriction(محدودیت) on where you put the file containing the entity.
*/

//4*:
//In Dart, a property is a field variable declared within a class that allows you to manage data encapsulated(5*) in that class.

//5*:
//Encapsulated properties in Dart involve hiding the details of a class's data and methods, allowing access only through defined interfaces.

// entity/person.dart
import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int id;

  final String name;

  Person(this.id, this.name);
}

/*
3. Create a DAO (Data Access Object) :

This component is responsible for managing access to the underlying SQLite database. 
The abstract class contains the method signatures for querying the database which have to return a Future or Stream.

You can define queries by adding the @Query annotation to a method. 
The SQL statement has to get added in parenthesis. The method must return a Future or Stream of the Entity you're querying for.

@insert marks a method as an insertion method.


*/

// dao/person_dao.dart

import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPeople();

  @Query('SELECT name FROM Person')
  Stream<List<String>> findAllPeopleName();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);
}

/*

4. Create the Database 

It has to be an abstract class which extends FloorDatabase. 
Furthermore, it's required to add @Database() to the signature of the class. 
Make sure to add the created entity to the entities attribute of the @Database annotation. 
In order to make the generated code work, it's required to also add the listed imports.

Make sure to add part 'database.g.dart'; beneath the imports of this file. 
It's important to note that 'database' has to get exchanged with the filename of the database definition. 
In this case, the file is named database.dart.


*/

// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/person_dao.dart';
import 'entity/person.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}

/*
5. Run the Code Generator 

Run the generator with "flutter packages pub run build_runner build". 
To automatically run it, whenever a file changes, use " flutter packages pub run build_runner watch ".

*/


/*
6. Use the Generated Code 

For obtaining an instance of the database, use the generated "$FloorAppDatabase" class, which allows access to a database builder. 
The name is being composed by $Floor and the database class name. The string passed to "databaseBuilder()"" will be the database file name. 
For initializing the database, call build() and make sure to await the result.

In order to retrieve(بازیابی) the "PersonDao" instance, invoking(استناد کردن) the persoDao getter on the database instance is enough.
Its functions can be used as shown in the following snippet.

*/

final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

final personDao = database.personDao;
final person = Person(1, 'Frank');

await personDao.insertPerson(person);
final result = await personDao.findPersonById(1);

//Diagram of Room library architecture.
//https://developer.android.com/static/images/training/data-storage/room_architecture.png

/*
Let's talk about the Room library architecture.

*   The diagram (Figure 1) shows the relationships between the main components of the Room persistence library. 
    The Room persistence library is an abstraction layer over SQLite that gives developers full access to the power of SQLite with more convenient access.

*   Room uses data entities to represent tables in your app database.

*   Data Access Objects (DAOs) offer methods your app can use to query, update, insert, and delete information in your database.

*   The database class gives your app DAO instances that go with the database.

*   The app uses DAOs to recover information from the database. That information is returned as instances of the associated data entity object. 

*/