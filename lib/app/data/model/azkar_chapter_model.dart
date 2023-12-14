class AzkarChapterModel {
  int id;
  String name;
  int orderId;

  AzkarChapterModel({
    this.id = 0,
    this.name = "",
    this.orderId = 0,
  });

  factory AzkarChapterModel.fromMap(Map<String, dynamic> map) {
    return AzkarChapterModel(
      id: map['_id'] as int,
      name: map['name'] as String,
      orderId: map['order_id'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'order_id': orderId,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
