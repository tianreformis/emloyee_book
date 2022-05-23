// ignore_for_file: unused_field, unused_local_variable

import 'package:emloyee_book/data/local/db/app_db.dart';
import 'package:emloyee_book/widget/custom_date_time_picker_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;

import '../widget/custom_text_form_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  late AppDB _db;
  final TextEditingController _userNamecontroller = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthcontroller = TextEditingController();
  DateTime? _dateOfBirth;

  @override
  void initState() {
    _db = AppDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final entity = EmployeeCompanion(
                  userName: drift.Value(_userNamecontroller.text),
                  firstName: drift.Value(_firstNameController.text),
                  lastName: drift.Value(_lastNameController.text),
                  dateOfBirth: drift.Value(_dateOfBirth!),
                );

                _db.insertEmployee(entity).then(
                      (value) =>
                          ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          content: Text('New Employee Inserted $value'),
                          actions: [
                            TextButton(
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner(),
                                child: const Text('Close'))
                          ],
                        ),
                      ),
                    );
              },
              icon: const Icon(Icons.save))
        ],
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
          CustomDatePickerFormField(
              controller: _dateOfBirthcontroller,
              txtLabel: 'Date Of Birth',
              callback: () {
                pickDateOfBirth(context);
              })
        ]),
      ),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfBirth ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.pink,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child ?? const Text(' '),
            ));

    if (newDate == null) {
      return;
    }
    setState(() {
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateOfBirthcontroller.text = dob;
    });
  }
}
