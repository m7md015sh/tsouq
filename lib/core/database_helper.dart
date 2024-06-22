import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/model/products_model.dart';
import '../utils/app_constants.dart';


class DatabaseHelper{
    DatabaseHelper._();
    static final DatabaseHelper db=   DatabaseHelper._();
    static late Database _database;

  Future<Database?> get database async{
    if(database!=null)
      {
        return _database;
      }

    _database=await initDb();
  }
  initDb()async{
    String path=join(await getDatabasesPath(),"CartProduct.db");
    return await openDatabase(path,
        version: 1,onCreate: (Database db,int version)async{
      await db.execute('''
      CREATE TABLE ${AppConstants.tableCartProduct}(
      ${AppConstants.columnName} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AppConstants.columnImage} TEXT NOT NULL,
      ${AppConstants.columnQuantity} TEXT NOT NULL,
      ${AppConstants.columnPrice} INTEGER NOT NULL,)
      ''');
    });
  }

  Future<void>insert(Product cart)async{
    var dbClint=await database;
    await dbClint!.insert(AppConstants.tableCartProduct, cart.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);


  }

  updateUser(Product user)async{
    var dbClint=await database;
    await dbClint!.update(AppConstants.tableCartProduct, user.toJson(),
      where:'${AppConstants}=?',
    whereArgs: [user.id],
    );
  }
//   Future<UserModel?>getUser(int id)async{
//     var dbClint=await database;
//    List<Map<String,dynamic>>maps= await dbClint!.query(tableUser,where: '$columnId=?',
//     whereArgs: [id],
//     );
//     if(maps.length > 0){
//       return UserModel.fromJson(maps.first);
//     }else{
//       return null;
//     }
//   }
//   Future<List<Map<String, dynamic>>>getAllUsers() async{
//     var dbClint=await database;
//    List<Map<String,dynamic>>list= await dbClint!.query(tableUser,);
//
//     list.isEmpty?
//     list.map((user) => UserModel.fromJson(user)).toList():[];
//    return list;
//
// }
//
// Future<int>deleteUser(int id)async{
//   var dbClint=await database;
//   return await dbClint!.delete(tableUser,where: '$columnId=?',whereArgs: [id]);
//
// }
}