import 'package:sobat_test/model/review.dart';
import 'package:sobat_test/repo/database.dart';
import 'package:sqflite/sqflite.dart';

class ReviewDAO {
  final databaseProvider = DatabaseProvider().databaseProvider;

  //add
  Future<int> createReview (Review review) async {
    final database = await databaseProvider.database;
    var result = database.insert(
        reviewTABLE, review.toMapDatabase(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  //update
  Future<int> updateReview (Review review) async {
    final database = await databaseProvider.database;
    var result = await database.update(
        reviewTABLE, review.toMapDatabase(), where: "id = ?", whereArgs: [review.id]);
    return result;
  }

  //delete
  Future<int> deleteReview (int id) async {
    final database = await databaseProvider.database;
    var result = await database.delete(
      reviewTABLE, where: 'id = ?', whereArgs: [id]
    );
    return result;
  }

  //delete All
  Future deleteAllReview() async {
    final database = await databaseProvider.database;
    var result = await database.delete(reviewTABLE,);
    return result;
  }

  //Read Review
  Future<Review?> getReview (int id) async {
    final database = await databaseProvider.database;
    var result = await database.query(reviewTABLE, where: 'id LIKE ? ', whereArgs: [id]);
    return result.isNotEmpty ? Review.fromJson(result.first) : null;
  }

  //Read all Review
  Future<List<Review>> getAllReview() async {
    final database = await databaseProvider.database;
    var result = await database.query(reviewTABLE);
    List<Review> reviews = result.isNotEmpty ? result.map((data) => Review.fromJson(data)).toList() : [];
    return reviews;
  }

}