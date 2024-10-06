import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:travel/constants/colors.dart';
import 'package:travel/routes/routes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _emailAddress = '';
  String _surname = '';
  String _role = 'User'; // Default role
  List<String> _availableRoles = [
    'User',
    'Admin',
    'General Technician',
    'Field Technician',
    'Network Technician',
    'Remote Technician',
  ];

  Future<void> _saveUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Get a reference to the database
      final database = await _initDatabase();

      // Insert the user into the database
      await database.insert(
        'users',
        {
          'firstName': _firstName,
          'surname': _surname,
          'email': _emailAddress,
          'role': _role,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // Show a success message or navigate to another screen
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(content: Text('User created successfully!')));
    }
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'user_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT, surname TEXT, role TEXT)',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
      title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onSaved: (value) => _firstName = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Surname'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                onSaved: (value) => _surname = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
                onSaved: (value) => _emailAddress = value!,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Role'),
                value: _role,
                items: _availableRoles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _role = value!),
              ),
              ElevatedButton(
                onPressed: () {
                  _saveUser();
                  // Navigate to the login screen after saving the user
                  Navigator.pushNamed(context, AppRoutes.ROUTE_Login); // Replace '/login' with your actual route name
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}