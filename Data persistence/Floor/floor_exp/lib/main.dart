import 'package:flutter/material.dart';
import 'package:floor_exp/dao/person_dao.dart';
import 'package:floor_exp/entity/person.dart';
import 'package:floor_exp/database/database.dart';
////

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  print('Database created');

  final personDao = database.personDao;
  final person = Person(1, 'Frank');

  await personDao.insertPerson(person);
  final result = await personDao.findPersonById(1);
  print(result);
}
