class AnimeTitleModel {
  final String english;

  const AnimeTitleModel({
    required this.english,
  });

  factory AnimeTitleModel.fromJson(Map<String, dynamic> json) {
    return AnimeTitleModel(
      english: json['english'] as String,
    );
  }
}
