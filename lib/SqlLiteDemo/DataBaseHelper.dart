import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Databasehelper{
  static final Databasehelper _instance = Databasehelper._internal();
  factory Databasehelper()=> _instance;


  static Database? _database;
  Databasehelper._internal();


  Future<Database> get database async{
    if(_database !=null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async{
    String path = join(await getDatabasesPath(), 'example.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }


  Future<void>  _onCreate(Database db, int version)async{
    await db.execute('''
            CREATE TABLE students(
                   id INTEGER PRIMARY KEY AUTOINCREMENT,
                   name Text
                   )
         ''');
  }


  Future<int> insertItem(Map<String, dynamic> item)async{


    Database db = await database;
    return  await db.insert('students', item);
  }


  Future<List<Map<String,dynamic>>> getItem()async{
    Database db = await database;
    return  await db.query('students');
  }
}
