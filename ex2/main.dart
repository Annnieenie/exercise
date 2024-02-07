import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 251, 194, 37),
            title: Text('Veggie & Fruit Shop'),
            bottom: TabBar(
              labelColor: Color.fromARGB(100, 244, 101, 56),
              tabs: [
                Tab(text: 'Veg Shop'),
                Tab(text: 'About Us'),
                Tab(text: 'Shop'),
                Tab(text: 'Cart'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Veggie Shop Content')),
              Center(child: Text('About Us Content')),
              Center(child: Text('Shop Content')),
              Center(
                child: CartContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double totalPrice = fruitsAndVegetables.fold(0,
        (total, product) => total + (product['price'] * product['quantity']));
    double totalQuantity = fruitsAndVegetables.fold(
        0, (total, product) => total + product['quantity']);
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 255, 224, 163),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: fruitsAndVegetables.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 20), // Add space between items
              itemBuilder: (context, index) {
                final product = fruitsAndVegetables[index];
                return Container(
                  color: Color.fromARGB(100, 228, 179, 179),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(product['image']),
                    ),
                    title: Text(product['name']),
                    subtitle: Text(
                        'Price: \$${product['price']} | Quantity: ${product['quantity']}'),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Price:',
                        style: TextStyle(
                            color: const Color.fromARGB(99, 138, 89, 16))),
                    Text('Total Quantity:',
                        style: TextStyle(
                            color: const Color.fromARGB(99, 138, 89, 16))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$$totalPrice',
                        style:
                            TextStyle(color: Color.fromARGB(99, 138, 89, 16))),
                    Text('$totalQuantity',
                        style: TextStyle(
                            color: const Color.fromARGB(99, 138, 89, 16))),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your payment processing logic here
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(100, 240, 240, 240)),
            ),
            child: Text('Continue Payment'),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> fruitsAndVegetables = [
  {
    'name': 'Apple',
    'price': 2.50,
    'quantity': 3,
    'image': 'assets/Apple.jpg',
  },
  {
    'name': 'Banana',
    'price': 1.20,
    'quantity': 5,
    'image': 'assets/Banana.jpg',
  },
  {
    'name': 'Carrot',
    'price': 1.00,
    'quantity': 2,
    'image': 'assets/Carrot.jpg',
  },
  {
    'name': 'Orange',
    'price': 1.80,
    'quantity': 4,
    'image': 'assets/Orange.jpg',
  },
];
