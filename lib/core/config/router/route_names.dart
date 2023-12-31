class RouteInfo {
  final String name;
  final String path;

  const RouteInfo(this.name, this.path);
}

class RouteNames {
  static const welcome = RouteInfo('welcome', '/welcome');
  static const login = RouteInfo('login', '/login');
  static const register = RouteInfo('register', '/register');
  static const rating = RouteInfo('rating', '/rating');
  static const question = RouteInfo('question', '/question');
  static const restaurant = RouteInfo('restaurant', '/restaurant');
}
