class Review{
  final int id;
  final String name;
  final String review;
  final int rating;

  Review({
    required this.id,
    required this.name,
    required this.review,
    required this.rating
});

  Map<String, dynamic> toMapDatabase() {
    return {
      'id': this.id,
      'name': this.name,
      'review': this.review,
      'rating': this.rating,
    };
  }

  factory Review.fromJson(Map<String, dynamic> data) {
    return Review(
        id: data['id'],
        name: data['name'],
        review: data['review'],
        rating: data['rating']);
  }

  @override
  String toString() {
    return 'Review{id: $id, name: $name, review: $review, rating: $rating}';
  }

}