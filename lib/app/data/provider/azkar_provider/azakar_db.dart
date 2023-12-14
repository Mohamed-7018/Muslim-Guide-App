import 'dart:io';

import 'package:flutter/services.dart';
import 'package:muslim_dialy_guide/app/data/model/azkar_chapter_model.dart';
import 'package:muslim_dialy_guide/app/data/model/azkar_title_model.dart';
import 'package:muslim_dialy_guide/app/data/model/azkar_zikr_content_model.dart';
import 'package:muslim_dialy_guide/app/data/provider/azkar_provider/user_data_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AzkarDatabaseHelper {
  //! database name & version [very important]
  static const String databaseTableName = 'mislim_dialy_guide_hisn_elmuslim.db';
  static const int databaseVersion = 1;

  //! use singleton - make only one object from the class
  static AzkarDatabaseHelper? _azkarDatabaseHelper;
  static Database? _database;

  factory AzkarDatabaseHelper() {
    _azkarDatabaseHelper ??= AzkarDatabaseHelper._createInstance();
    return _azkarDatabaseHelper!;
  }

  AzkarDatabaseHelper._createInstance();

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

  // //! load all the azkar chapters from the database
  Future<List<AzkarChapterModel>> getAllAzkarChaptersFromDatabase() async {
    final Database db = await database;

    final List<Map<String, dynamic>> dbMap = await db.query('chapters');

    return List.generate(dbMap.length, (index) {
      return AzkarChapterModel.fromMap(dbMap[index]);
    });
  }

  // //! load all the azkar chapters from the database
  Future<List<AzkarTitleModel>> getAllAzkarTitlesFromDatabase() async {
    final Database db = await database;

    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * FROM titles''',
    );

    final List<AzkarTitleModel> azkarTitles = [];
    for (int i = 0; i < dbMaps.length; i++) {
      final AzkarTitleModel azkarTitle = AzkarTitleModel.fromMap(dbMaps[i]);
      await AzkarUserDataDatabaseHelper()
          .isTitleFavourite(titleId: azkarTitle.id)
          .then((value) {
        azkarTitle.favourite = value;
      });

      azkarTitles.add(azkarTitle);
    }

    return azkarTitles;
  }

  // //! Get title by it's index[$id]
  Future<AzkarTitleModel> getAzkarTitleById({required int id}) async {
    final Database db = await database;

    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * FROM titles  WHERE order_id = ?''',
      [id],
    );

    final AzkarTitleModel azkarTitleModel = AzkarTitleModel.fromMap(dbMaps[0]);

    await AzkarUserDataDatabaseHelper()
        .isTitleFavourite(titleId: azkarTitleModel.id)
        .then((isFavourite) => azkarTitleModel.favourite = isFavourite);

    return azkarTitleModel;
  }

  //! get all content[Azkar contents]
  Future<List<AzkarZikrContentModel>> getAllContentsFromDatabase() async {
    final Database db = await database;

    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * FROM contents''',
    );

    final List<AzkarZikrContentModel> contents = [];

    for (var i = 0; i < dbMaps.length; i++) {
      final AzkarZikrContentModel dbContent =
          AzkarZikrContentModel.fromMap(dbMaps[i]);
      await AzkarUserDataDatabaseHelper()
          .isContetnFavourite(contentId: dbContent.id)
          .then((value) => dbContent.favourite = value);
      contents.add(dbContent);
    }

    return contents;
  }

  //! get contet [given : zikr title id]
  Future<List<AzkarZikrContentModel>> getAllContentsByTitleId(
      {required int titleId}) async {
    final Database db = await database;
    final List<Map<String, dynamic>> dbMaps = await db.rawQuery(
      '''SELECT * FROM contents  WHERE title_id = ? ORDER by order_id ASC''',
      [titleId],
    );

    final List<AzkarZikrContentModel> contents = [];

    for (var i = 0; i < dbMaps.length; i++) {
      final AzkarZikrContentModel azkarZikrContent =
          AzkarZikrContentModel.fromMap(dbMaps[i]);
      await AzkarUserDataDatabaseHelper()
          .isContetnFavourite(contentId: azkarZikrContent.id)
          .then((value) => azkarZikrContent.favourite = value);
      contents.add(azkarZikrContent);
    }
    return contents;
  }

  //! get contet [given : zikr content id]
  Future<AzkarZikrContentModel> getContentsByContentId({
    required int? contentId,
  }) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
      '''SELECT * FROM contents  WHERE _id = ?''',
      [contentId],
    );
    final AzkarZikrContentModel azkarZikrContent =
        AzkarZikrContentModel.fromMap(maps[0]);
    await AzkarUserDataDatabaseHelper()
        .isContetnFavourite(contentId: azkarZikrContent.id)
        .then((value) => azkarZikrContent.favourite = value);

    return azkarZikrContent;
  }
}
