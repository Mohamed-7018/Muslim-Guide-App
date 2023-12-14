
class FavAzkarTitleModel {
  int id;
  int titleId;
  bool favourite;

  FavAzkarTitleModel({
    this.id = 0,
    this.titleId = 0,
    this.favourite = false,
  });

  factory FavAzkarTitleModel.fromMap(Map<String, dynamic> map) {
    bool favourite;
    if ((map['favourite'] ?? 0) == 0) {
      favourite = false;
    } else {
      favourite = true;
    }
    return FavAzkarTitleModel(
      id: map['_id'] as int,
      titleId: map['title_id'] as int,
      favourite: favourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'title_id': titleId,
      'favourite': favourite,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
