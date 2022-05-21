import 'package:flutter/material.dart';

class CostumTextFormField extends StatelessWidget {
  const CostumTextFormField({
    Key? key,
    required TextEditingController controller,
    required String txtLabel,
  })  : _controller = controller,
        _txtLabel = txtLabel,
        super(key: key);

  final TextEditingController _controller;
  final String _txtLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(_txtLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$_txtLabel Cannot Be Empty';
        }
        return null;
      },
    );
  }
}
