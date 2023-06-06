import 'package:flutter/material.dart';
import 'package:take_away_app/models/coursierModel.dart';
import 'package:take_away_app/services/categoryService.dart';
import 'package:take_away_app/services/coursierService.dart';

class NewCoursierPage extends StatefulWidget {
  const NewCoursierPage({Key? key}) : super(key: key);

  @override
  _NewCoursierPageState createState() => _NewCoursierPageState();
}

class _NewCoursierPageState extends State<NewCoursierPage> {
  final CoursierService coursiersService = CoursierService();
  final CategoryService categoryService = CategoryService();
  final _formKey = GlobalKey<FormState>();

  var data;
  String? selectedCategory;
  List<String>? categories = [];

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final recruitmentDateController = TextEditingController();
  final phoneNumberController = TextEditingController();

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

    categoriesToString();
    print(data[1]['category_name']);
    print(data.runtimeType);
  }

  void categoriesToString() {
    for (var item in data) {
      print(item['category_name']);
      categories?.add(item['category_name'].toString());
    }
    print(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Coursier'),
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
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
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
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: recruitmentDateController,
                  decoration: const InputDecoration(
                    labelText: 'Recruitment Date',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a recruitment date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: categories?.map<DropdownMenuItem<String>>((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final newCoursier = {
                    'name': nameController.text,
                    'adress': addressController.text,
                    'recruitment_date': recruitmentDateController.text,
                    'Num_tel': phoneNumberController.text,
                    'category_name': selectedCategory,
                  };
                  coursiersService.addCoursiers(newCoursier);
                }
                Navigator.pop(context);
              },
              child: const Text('Add a Coursier'),

            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
