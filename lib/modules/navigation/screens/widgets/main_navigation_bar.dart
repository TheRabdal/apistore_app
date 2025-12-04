import 'package:apistore_app/packages/packages.dart';

class MainNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const MainNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}
