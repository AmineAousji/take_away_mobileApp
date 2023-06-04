import 'package:flutter/material.dart';
import 'package:take_away_app/models/categoriesModel.dart';
import '../services/categoryService.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryService categoryService = CategoryService();

  late Future<List<Categories>>? categories;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   categories = categoryService.getCategories() ;
  // }


  var jsonList;
  var data;
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    setState((){
      jsonList = categoryService.getCategories();
    });
    data = await jsonList;
    print(data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Away'),
      ),
      body: ListView.builder(
          itemCount:data == null ? 0 : data.length,
             itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  title: Text(data[index]['category_name']),
                  subtitle: Text(data[index]['description']),
                ));
          }),
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
              title: const Text('Categories'),
              onTap: () => categoryService.getData()
            ),
            ListTile(
              title: const Text('Coursiers'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                // Handle item 3 tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
