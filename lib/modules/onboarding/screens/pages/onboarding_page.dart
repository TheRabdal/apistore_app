import 'package:apistore_app/packages/packages.dart';

class OnboardingPage extends StatefulWidget {
  static const route = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingSlide(
                    image: Icons.shopping_cart_outlined,
                    title: 'Selamat Datang di API Store',
                    description: 'Temukan produk dan penawaran luar biasa.',
                  ),
                  OnboardingSlide(
                    image: Icons.credit_card_outlined,
                    title: 'Pembayaran Aman',
                    description:
                        'Berbelanja dengan percaya diri menggunakan gateway pembayaran aman kami.',
                  ),
                  OnboardingSlide(
                    image: Icons.delivery_dining_outlined,
                    title: 'Pengiriman Cepat',
                    description:
                        'Dapatkan pesanan Anda diantar ke depan pintu Anda dengan cepat.',
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => OnboardingDot(
                        index: index,
                        currentPage: _currentPage,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        _currentPage == 2 ? 'Mulai' : 'Lanjut',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  if (_currentPage != 2)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Lewati',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  else
                    const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
