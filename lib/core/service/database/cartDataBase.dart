

import 'package:appwithfirebase/model/cartProductModel.dart';
import 'package:appwithfirebase/constance.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDtatBase{

  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }
  initialDb() async {
    String databasePath = await getDatabasesPath();

    String path = join(databasePath, 'cartProductModel.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1);
    return mydb;
  }


  _onCreate(Database db, int version) async {

    Batch batch=db.batch();
    batch.execute(''' 
    CREATE TABLE $tableCardProduct (
    $columnName TEXT NOT NULL ,
    $columnImage TEXT NOT NULL ,
    $columnPrice TEXT NOT NULL ,
    $columnQuantity INTEGER NOT NULL ,
    $columnProductId TEXT NOT NULL)
    ''');
    await batch.commit();
    print("Create Database and table========");
  }



  insert(CartProductModel model) async {
    Database? mydb = await db;
    int response = await mydb!.insert(tableCardProduct,model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  updateProduct(CartProductModel model) async {
    Database? mydb = await db;
    int response = await mydb!.update(tableCardProduct,model.toJson(),where:'$columnProductId=?',whereArgs: [model.productId] );
    return response;
  }


  Future<List<CartProductModel>> getAllProduct ()async{
      Database? mydb = await db;
      List<Map> maps = await mydb!.query(tableCardProduct);
      List<CartProductModel>list=maps.isNotEmpty?maps.map((product) => CartProductModel.fromJson(product)).toList():[];
      return list;
    }


}