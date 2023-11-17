class RouteInfo {
  final String name;
  final String path;

  const RouteInfo(this.name, this.path);
}

class RouteNames {
  static const onBoarding = RouteInfo('on-boarding', '/on-boarding');
  static const login = RouteInfo('login', '/login');
  static const register = RouteInfo('register', '/register');
  static const rating = RouteInfo('rating', '/rating');
  static const question = RouteInfo('question', '/question');

  static const List<RouteInfo> routes = [
    onBoarding,
    login,
    register,
    rating,
    question,
  ];

  static Map<String, String> get paths {
    return Map.fromEntries(
        routes.map((route) => MapEntry(route.name, route.path)));
  }
}
