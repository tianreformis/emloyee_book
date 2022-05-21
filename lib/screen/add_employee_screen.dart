// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../widget/custom_text_form_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _userNamecontroller = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthcontroller = TextEditingController();
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
          CostumTextFormField(
            controller: _userNamecontroller,
            txtLabel: 'User Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          CostumTextFormField(
            controller: _firstNameController,
            txtLabel: 'First Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          CostumTextFormField(
            controller: _lastNameController,
            txtLabel: 'Last Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          CostumTextFormField(
            controller: _dateOfBirthcontroller,
            txtLabel: 'Date Of Birth',
          )
        ]),
      ),
    );
  }
}
