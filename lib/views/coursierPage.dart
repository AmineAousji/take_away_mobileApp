import 'package:flutter/material.dart';
import 'package:take_away_app/services/coursierService.dart';

class CoursierPage extends StatefulWidget {
  const CoursierPage({Key? key}) : super(key: key);

  @override
  _CoursierPageState createState() => _CoursierPageState();
}

class _CoursierPageState extends State<CoursierPage> {
  final CoursierService coursiersService = CoursierService();

  var jsonList;
  var data;

  @override
  void initState() {
    super.initState();
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
        title: const Text('Coursiers'),
      ),
      body: ListView.builder(
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
                            // Handle edit button tap
                          },
                          icon: Icon(Icons.edit),
                        ),
                        SizedBox(width: 20.0), // Add some space between the buttons
                        IconButton(
                          onPressed: () {
                            // Handle delete button tap
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
    );
  }
}
