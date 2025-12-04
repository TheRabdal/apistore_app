import 'package:apistore_app/packages/packages.dart';

class OnboardingDot extends StatelessWidget {
  final int index;
  final int currentPage;

  const OnboardingDot({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Theme.of(context).primaryColor
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

