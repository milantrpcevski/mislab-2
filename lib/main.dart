import 'package:flutter/material.dart';

void main() {
  runApp(ClothesApp());
}

class ClothesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      'name': 'T-Shirt',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWKLwTEIoZy2MGgd0EH5utO6tjp4GyjoE4dA&s',
      'description': 'A comfortable cotton T-shirt, perfect for casual wear.',
      'price': '15.99 USD',
    },
    {
      'name': 'Long Sleeve',
      'image': 'https://img.freepik.com/premium-psd/long-sleeve-white-tshirt-isolated-transparent-background_177659-153.jpg',
      'description': 'A warm and stylish long-sleeve shirt for colder days.',
      'price': '29.99 USD',
    },
    {
      'name': 'Hoodie',
      'image': 'https://img.freepik.com/premium-psd/white-hoodie-isolated-transparent-background-png_1073071-1088.jpg?w=360',
      'description': 'A cozy hoodie with a modern design, ideal for everyday use.',
      'price': '39.99 USD',
    },
    {
      'name': 'Jeans',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHotc8w-alyFYXTGnO6So5kUxaLWfKVZ5x4w&s',
      'description': 'Classic blue denim jeans, a wardrobe essential.',
      'price': '49.99 USD',
    },
    {
      'name': 'Trousers',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKgMUWc9ZrNSp-PSL_eP9xtLu0CoeU6uPQSw&s',
      'description': 'Stylish and comfortable trousers for any occasion.',
      'price': '34.99 USD',
    },
    {
      'name': 'Shoes',
      'image': 'https://w7.pngwing.com/pngs/415/691/png-transparent-sneakers-skate-shoe-nike-dunk-nike-skateboarding-nike-dunk-white-outdoor-shoe-running-thumbnail.png',
      'description': 'Durable and comfortable shoes for daily wear.',
      'price': '99.99 USD',
    },
    {
      'name': 'Boots',
      'image': 'https://i1.wp.com/hypebeast.com/image/2016/08/high-top.png',
      'description': 'Warm and sturdy boots, great for winter adventures.',
      'price': '79.99 USD',
    },
    {
      'name': 'Socks',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJHGQbkpMQdTGN-6yTtVi5_6Dt7iqwNrdoCQ&s',
      'description': 'Festive New Year socks, perfect for gifting.',
      'price': '4.99 USD',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Индекс: 206063'),
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return Card(
            child: ListTile(
              leading: Image.network(item['image']!),
              title: Text(item['name']!),
              subtitle: Text(item['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item['image']!),
            SizedBox(height: 16),
            Text(
              item['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(item['description']!),
            SizedBox(height: 16),
            Text(
              'Price: ${item['price']}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
