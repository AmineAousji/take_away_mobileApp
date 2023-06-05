import 'package:flutter/material.dart';
import 'package:take_away_app/models/categoriesModel.dart';
import 'package:take_away_app/views/coursierPage.dart';
import 'package:take_away_app/views/newCoursierPage.dart';
import 'package:take_away_app/views/ordersPage.dart';
import '../services/categoryService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryService categoryService = CategoryService();

  late Future<List<Categories>>? categories;

  var data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var jsonList = categoryService.getCategories();
    var result = await jsonList;
    setState(() {
      data = result;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Away'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index]['category_name']),
                    subtitle: Text(data[index]['description']),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewCoursierPage()),
                      );
                    },
                    child: const Text('Add a coursier'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Add an Order'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Take Away',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Coursiers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursierPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
