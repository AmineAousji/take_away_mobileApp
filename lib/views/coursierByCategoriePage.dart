import 'package:flutter/material.dart';
import 'package:take_away_app/services/categoryService.dart';
import 'package:take_away_app/services/coursierService.dart';
import 'package:take_away_app/views/modifyCoursierPage.dart';

class CoursierByCategoryPage extends StatefulWidget {
  final Map<String, dynamic> cardData;
  const CoursierByCategoryPage({Key? key, required this.cardData}) : super(key: key);

  @override
  _CoursierByCategoryPageState createState() => _CoursierByCategoryPageState();
}

class _CoursierByCategoryPageState extends State<CoursierByCategoryPage> {
  final CategoryService categoryService = CategoryService();

  var jsonList;
  var data;

  final categoryNameController = TextEditingController();
  final description = TextEditingController();





  @override
  void initState() {
    super.initState();
    categoryNameController.text = widget.cardData['category_name'];
    description.text = widget.cardData['description'];
    loadData();
  }

  Future<void> loadData() async {
    String category = widget.cardData['category_name'];
    jsonList = categoryService.getCourisersBycategry(category);
    data = await jsonList;
    setState(() {});
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coursiers By Category'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Category Name: ${widget.cardData['category_name']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
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
                        title: Text(data[index]['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(data[index]['category_name']),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Phone Number: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data[index]['Num_tel'],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Address: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data[index]['adress'],
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
                                  bool modifyOrDelete = true;
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ModifyCoursierPage(coursierData: data[index], modifyOrDelete: modifyOrDelete,)),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              const SizedBox(width: 20.0), // Add some space between the buttons
                              IconButton(
                                onPressed: () {
                                  bool modifyOrDelete = false;
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ModifyCoursierPage(coursierData: data[index], modifyOrDelete: modifyOrDelete,)),
                                  );
                                },
                                icon: Icon(Icons.delete),
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
          ),
        ],
      ),
    );

  }
}
