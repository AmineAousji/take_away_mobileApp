import 'package:flutter/material.dart';
import 'package:take_away_app/services/orderService.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({Key? key}) : super(key: key);

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  final OrderService orderService = OrderService();
  final _formKey = GlobalKey<FormState>();

  var data;
  String? selectedCategory;
  List<String>? categories = [];

  final nameCustomerController = TextEditingController();
  final addressCustomerController = TextEditingController();
  final nameRestaurantController = TextEditingController();
  final addressRestaurantController = TextEditingController();
  final priceController = TextEditingController();
  final distanceController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: nameCustomerController,
                  decoration: const InputDecoration(
                    labelText: 'Customer name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: addressCustomerController,
                  decoration: const InputDecoration(
                    labelText: 'Customer Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the customer address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: nameRestaurantController,
                  decoration: const InputDecoration(
                    labelText: 'Restaurant name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a restaurant name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: addressRestaurantController,
                  decoration: const InputDecoration(
                    labelText: 'Restaurant address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Address of the restaurant';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: distanceController,
                  decoration: const InputDecoration(
                    labelText: 'Distance',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the distance';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newOrder = {
                        'name_customer': nameCustomerController.text,
                        'name_restaurant': nameRestaurantController.text,
                        'adress_customer': addressCustomerController.text,
                        'adress_restaurant': addressRestaurantController.text,
                        'price': priceController.text,
                        'distance': distanceController.text,

                      };
                      orderService.addOrders(newOrder);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Add an Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
