import 'package:flutter/material.dart';
import 'package:take_away_app/services/orderService.dart';
import 'package:take_away_app/views/assignOrderPage.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final OrderService orderService = OrderService();

  var jsonList;
  var data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    jsonList = orderService.getOrders();
    data = await jsonList;
    setState(() {});
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.article_rounded),
                  title: Text(data[index]['order_id'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(data[index]['name_customer']),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Restaurant: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        data[index]['name_restaurant'],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        data[index]['price'],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Distance: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        data[index]['distance'],
                      ),
                    ],
                  ),
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

                          },
                          icon: const Icon(Icons.edit),
                        ),
                        const SizedBox(width: 20.0),
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.delete),
                        ),
                        const SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed:  data[index]['coursier_id'] != null ? null : () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AssignOrderPage(orderData: data[index])),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text(
                            'Assign',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
