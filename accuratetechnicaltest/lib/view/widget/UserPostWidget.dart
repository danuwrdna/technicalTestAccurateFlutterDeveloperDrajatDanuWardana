import 'package:flutter/material.dart';
import 'package:accuratetechnicaltest/model/UserApi.dart';
import 'package:accuratetechnicaltest/viewmodel/UserPostViewModel.dart';

class UserPostWidget extends StatefulWidget {
  const UserPostWidget({Key? key}) : super(key: key);

  @override
  _UserPostWidgetState createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget> {
  final UserPostViewModel _userPostViewModel = UserPostViewModel();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String _notificationMessage = '';

  void _saveUser() async {
    if (_validateInputs()) {
      UserApi user = UserApi(
        name: _nameController.text,
        email: _emailController.text,
        address: _addressController.text,
        city: _cityController.text,
        phoneNumber: _phoneNumberController.text,
      );
      await _userPostViewModel.postUser(user);

      setState(() {
        _notificationMessage = 'Successfully, please click refresh icon';
      });
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });
    }
  }

  bool _validateInputs() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields must be filled'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add User'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            if (_notificationMessage.isNotEmpty)
              Text(
                _notificationMessage,
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            _saveUser();
          },
        ),
      ],
    );
  }
}
