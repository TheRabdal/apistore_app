import 'package:apistore_app/packages/packages.dart';

class FeaturedApisSection extends StatelessWidget {
  const FeaturedApisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Featured APIs',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
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
        ),
      ],
    );
  }
}

