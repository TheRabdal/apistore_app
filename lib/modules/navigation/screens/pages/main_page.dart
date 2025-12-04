import 'package:apistore_app/packages/packages.dart';

class MainPage extends StatefulWidget {
  static const route = '/main';
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DashboardHomePage(username: widget.username),
      const ProductPage(),
      ProfilePage(username: widget.username),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: MainNavigationBar(
        currentIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
