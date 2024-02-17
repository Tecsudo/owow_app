class RatingData {
  final int experience;
  final int food;
  final int services;
  final int ambiance;

  RatingData({
    required this.experience,
    required this.food,
    required this.services,
    required this.ambiance,
  });

  @override
  String toString() {
    return '''
    {
      experience: $experience,
      food: $food,
      services: $services,
      ambiance: $ambiance
    } ''';
  }
}
