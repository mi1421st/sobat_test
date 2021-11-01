import 'package:sobat_test/model/DAO/reviewDAO.dart';
import 'package:sobat_test/model/review.dart';

class ReviewRepository{

  final reviewDao = ReviewDAO();

  Future getReview(int id) => reviewDao.getReview(id);

  Future getAllReview() => reviewDao.getAllReview();

  Future createReview(Review review) => reviewDao.createReview(review);

  Future updateReview(Review review) => reviewDao.updateReview(review);

  Future deleteReview(int id) => reviewDao.deleteReview(id);

  Future deleteAllReview() => reviewDao.deleteAllReview();

}