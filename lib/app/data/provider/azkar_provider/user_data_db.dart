import 'dart:io';

import 'package:flutter/services.dart';
import 'package:muslim_dialy_guide/app/data/model/azkar_title_model.dart';
import 'package:muslim_dialy_guide/app/data/model/azkar_zikr_content_model.dart';
import 'package:muslim_dialy_guide/app/data/model/fav_azkar_title_model.dart';
import 'package:muslim_dialy_guide/app/data/model/fav_azkar_zikr_content_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AzkarUserDataDatabaseHelper {
  //! database name & version [very important]
  static const String databaseTableName =
      'mislim_dialy_guide_azkar_user_data.db';
  static const int databaseVersion = 1;

  //! use singleton - make only one object from the class
  static AzkarUserDataDatabaseHelper? _azkarDatabaseHelper;
  static Database? _database;

  factory AzkarUserDataDatabaseHelper() {
    _azkarDatabaseHelper ??= AzkarUserDataDatabaseHelper._createInstance();
    return _azkarDatabaseHelper!;
  }

  AzkarUserDataDatabaseHelper._createInstance();

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database!;
  }

  //* ---------------------------------------------- *//
  // * --------- Daatabase functions --------------- *//

  //!  function to intialize database
  /*  
    1- function try to find the database in the mobile (saved before)
    if the database is not created [first time] - load it from assets

    2- after this check open the database to read from it

    3- check the version  -  if the existing version is lower than the 
    new appbundle version then update the database by doinf the following :
       i - close the database
       ii- delete the old database file
       iii- copy the new database file from asset folder to documents directory
  */
  Future<Database> _initializeDatabase() async {
    final String getDatabasePath = await getDatabasesPath();
    final String databasePath = join(getDatabasePath, databaseTableName);

    if (!await databaseExists(databasePath)) {
      _loadDatabaseFromAssets(databasePath: databasePath);
    }

    Database database = await openDatabase(databasePath);

    await database.getVersion().then(
      (currentDatabaseVersion) async {
        if (currentDatabaseVersion < databaseVersion) {
          database.close();
          await deleteDatabase(databasePath);
          await _loadDatabaseFromAssets(databasePath: databasePath);
        }
      },
    );

    return database = await openDatabase(
      databasePath,
      version: databaseVersion,
    );
  }

  //! Load the db from the assets in the first time only
  Future<void> _loadDatabaseFromAssets({required String databasePath}) async {
    try {
      await Directory(dirname(databasePath)).create(recursive: true);

      final ByteData data =
          await rootBundle.load(join('assets', 'db', databaseTableName));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);
    } catch (e) {}
  }

  //! get All favoutite Azkars
  Future<List<FavAzkarTitleModel>> getAllFavouriteTitleFromDatabase() async {
    final Database db = await database;

    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * from favourite_titles WHERE favourite = 1 order by title_id asc''',
    );

    return List.generate(dbMaps.length, (i) {
      return FavAzkarTitleModel.fromMap(dbMaps[i]);
    });
  }

  //! check if the title is favourite
  Future<bool> isTitleFavourite({required int titleId}) async {
    final Database db = await database;
    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * from favourite_titles WHERE title_id = ?''',
      [titleId],
    );

    final FavAzkarTitleModel dbTitleFavourite =
        List.generate(dbMaps.length, (i) {
      return FavAzkarTitleModel.fromMap(dbMaps[i]);
    }).first;

    return dbTitleFavourite.favourite;
  }

  //! add title to favourite
  Future<void> addTitleToFavourite(
      {required AzkarTitleModel azkarTitleModel}) async {
    final Database db = await database;
    azkarTitleModel.favourite = true;

    await db.rawUpdate(
      'UPDATE favourite_titles SET favourite = ? WHERE title_id = ?',
      [1, azkarTitleModel.id],
    );
  }

  //! delete title from favourite
  Future<void> deleteTitleFromFavourite(
      {required AzkarTitleModel azkarTitleModel}) async {
    final Database db = await database;
    azkarTitleModel.favourite = false;

    await db.rawUpdate(
      'UPDATE favourite_titles SET favourite = ? WHERE title_id = ?',
      [0, azkarTitleModel.id],
    );
  }

  //! get favourite contents
  Future<List<FavAzkarZikrContentModel>> getFavContents() async {
    final Database db = await database;

    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * from favourite_contents WHERE favourite = 1''',
    );

    return List.generate(
      dbMaps.length,
      (i) {
        return FavAzkarZikrContentModel.fromMap(dbMaps[i]);
      },
    );
  }

  //! check if the content is favourite
  Future<bool> isContetnFavourite({required int contentId}) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
      '''SELECT *  from favourite_contents WHERE content_id = ?''',
      [contentId],
    );

    final FavAzkarZikrContentModel favAzkarZikrContent =
        List.generate(maps.length, (index) {
      return FavAzkarZikrContentModel.fromMap(maps[index]);
    }).first;

    return favAzkarZikrContent.favourite;
  }

  //! add content to favourite
  Future<void> addToFavourites(
      {required AzkarZikrContentModel azkarZikrContent}) async {
    final Database db = await database;
    await db.rawUpdate(
      'UPDATE favourite_contents SET favourite = ? WHERE content_id = ?',
      [1, azkarZikrContent.id],
    );
  }


  //! delete content from favourite 
   Future<void> deleteContentFromFavourite({
    required AzkarZikrContentModel azkarZikrContent,
  }) async {
    final Database db = await database;
    azkarZikrContent.favourite = false;

    await db.rawUpdate(
      'UPDATE favourite_contents SET favourite = ? WHERE content_id = ?',
      [0, azkarZikrContent.id],
    );
  }
}
