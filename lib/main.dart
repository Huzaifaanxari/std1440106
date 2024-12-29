import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Laptop',
      'description': 'A high-performance laptop.',
      'price': 1200.00,
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1711051475117-f3a4d3ff6778?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGFwdG9wfGVufDB8fDB8fHww'
    },
    {
      'name': 'Smartphone',
      'description': 'Latest Android smartphone.',
      'price': 800.00,
      'imageUrl': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG1vYmlsZXxlbnwwfHwwfHx8MA%3D%3D'
    },
    {
      'name': 'Headphones',
      'description': 'Noise-cancelling headphones.',
      'price': 150.00,
      'imageUrl': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lfGVufDB8fDB8fHww'
    },
    {
      'name': 'Smartwatch',
      'description': 'Stylish smartwatch with fitness tracking.',
      'price': 200.00,
      'imageUrl': 'https://images.unsplash.com/photo-1557438159-51eec7a6c9e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNtYXJ0JTIwd2F0Y2h8ZW58MHx8MHx8fDA%3D'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                product['imageUrl'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']),
              subtitle: Text('${product['description']}\n\$${product['price']}'),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to details page or perform an action
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(product['name']),
                    content: Text('Price: \$${product['price']}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
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
