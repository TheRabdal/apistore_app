import 'package:apistore_app/packages/packages.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Welcome back, User!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search APIs',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            'Featured APIs',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              FeaturedApiItem(
                icon: Icons.storage,
                name: 'Storage',
                onTap: () {},
              ),
              FeaturedApiItem(
                icon: Icons.analytics,
                name: 'Analytics',
                onTap: () {},
              ),
              FeaturedApiItem(
                icon: Icons.payment,
                name: 'Payments',
                onTap: () {},
              ),
              FeaturedApiItem(
                icon: Icons.map,
                name: 'Maps',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
