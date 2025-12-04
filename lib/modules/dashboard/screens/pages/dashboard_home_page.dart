import 'package:apistore_app/packages/packages.dart';

class DashboardHomePage extends StatelessWidget {
  final String username;
  const DashboardHomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Column(
        children: [
          ProfileHeaderCard(username: username),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const BestProductsSection(),
                    const FeaturedApisSection(),
                  ],),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
