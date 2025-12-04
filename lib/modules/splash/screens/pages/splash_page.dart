import 'dart:async';
import 'package:apistore_app/packages/packages.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/onboarding'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
            Text('Memuat...', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
