import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_away_app/services/coursierService.dart';
import 'package:take_away_app/services/orderService.dart';
import 'package:take_away_app/views/dashboard.dart';


class AssignOrderPage extends StatefulWidget {
  final Map<String, dynamic> orderData;

  const AssignOrderPage({Key? key, required this.orderData}) : super(key: key);

  @override
  _AssignOrderPageState createState() => _AssignOrderPageState();
}

class _AssignOrderPageState extends State<AssignOrderPage> {
  final OrderService orderService = OrderService();
  final _formKey = GlobalKey<FormState>();
  final CoursierService coursiersService = CoursierService();

  var jsonList;
  var data;
  String? selectedCategory;
  List<String>? categories = [];

  final orderIdController = TextEditingController();
  final nameCustomerController = TextEditingController();
  final nameRestaurantController = TextEditingController();
  final addressRestaurantController = TextEditingController();
  final priceController = TextEditingController();
  final distanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    orderIdController.text = widget.orderData['order_id'].toString();
    nameCustomerController.text = widget.orderData['name_customer'];
    nameRestaurantController.text = widget.orderData['name_restaurant'];
    priceController.text = widget.orderData['price'];
    distanceController.text = widget.orderData['distance'];
    loadData();
  }

  Future<void> loadData() async {
    jsonList = coursiersService.getCourisers();
    data = await jsonList;
    setState(() {});
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign an order'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: orderIdController,
                    decoration: const InputDecoration(
                      labelText: 'Order ID',
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: nameCustomerController,
                    decoration: const InputDecoration(
                      labelText: 'Customer name',
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                    validator: (value) {
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
                    enabled: false,
                    validator: (value) {
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
                    enabled: false,
                    validator: (value) {
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
                    enabled: false,
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          data[index]['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(data[index]['category_name']),
                      ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  final newOrder = {
                                    'name_customer': nameCustomerController.text,
                                    'name_restaurant': nameRestaurantController.text,
                                    'adress_customer': widget.orderData['adress_customer'],
                                    'adress_restaurant': widget.orderData['adress_restaurant'],
                                    'price': priceController.text,
                                    'distance': distanceController.text,
                                    'coursier_id': data[index]['coursier_id']

                                  };
                                  int coursier_id = data[index]['coursier_id'];
                                  int order_id = widget.orderData['order_id'];
                                  orderService.assignOrder(newOrder, coursier_id, order_id);
                                  //print(coursier_id.toString()  + ' ' + order_id.toString() );
                                  Navigator.pop(context, true);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));


                                },
                                icon: const Icon(Icons.add_business),
                              ),
                              const SizedBox(width: 20.0), // Add some space between the buttons

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
