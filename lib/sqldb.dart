// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// class SqlDb{
//   static Database? _db;
//
//   Future<Database?> get db async{
//     if(_db == null){
//       _db=await intialDb();
//       return _db;
//     }else{
//       return _db;
//     }
//   }
//
//   intialDb()async{
//     String databasePath=await getDatabasesPath();
//     String path=join(databasePath,'favorites.db');
//     Database mydb=await openDatabase(path,onCreate: _onCreate,onUpgrade: _onUpgrade);
//     return mydb;
//   }
//   _onUpgrade(Database db,int oldVersion,int newVersion){
//     print('Upgrade Database And Table');
//
//   }
//   _onCreate(Database db,int version,)async{
//     await db.execute('''
//     CREATE TABLE "favorites"(
//     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//     "image" TEXT NOT NULL,
//     "name" TEXT NOT NULL,
//     "price" REAL NOT NULL
//     )
//     ''');
//     print('Create Database And Table');
//   }
//   readData(String sql)async{
//     Database? mydb=await db;
//     List<Map> response=await mydb!.rawQuery(sql);
//     return response;
//   }
//  insertData(String sql)async{
//     Database? mydb=await db;
//     int response=await mydb!.rawInsert(sql);
//     return response;
//   }
//   updateData(String sql)async{
//     Database? mydb=await db;
//     int response=await mydb!.rawUpdate(sql);
//     return response;
//   }
//  deleteData(String sql)async{
//     Database? mydb=await db;
//     int response=await mydb!.rawDelete(sql);
//     return response;
//   }
// }