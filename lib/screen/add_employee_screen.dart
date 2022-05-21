// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'User name cannot be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Username'),
            ),
          ),
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'User name cannot be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Username'),
            ),
          )
        ]),
      ),
    );
  }
}
