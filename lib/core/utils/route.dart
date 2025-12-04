import 'package:apistore_app/packages/packages.dart';

Route<dynamic>? pageRoute(Widget page) {
  return MaterialPageRoute(builder: (_) => page);
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.route:
        return pageRoute(const SplashPage());

      case LoginPage.route:
        return pageRoute(const LoginPage());

      case OnboardingPage.route:
        return pageRoute(const OnboardingPage());

      case MainPage.route:
        final username = settings.arguments as String? ?? '';
        return pageRoute(MainPage(username: username));
      
      case ProductDetailPage.route:
        final productId = settings.arguments as String;
        return pageRoute(ProductDetailPage(productId: productId));

      default:
        return pageRoute(const SplashPage());
    }
  }
}
