
import 'package:flutter/material.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/constants/colors.dart';
import 'serviceRequest.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ServiceRequestForm extends StatefulWidget {
  final Function(ServiceRequest) onSubmit;
  final ServiceRequest? serviceRequest;

  ServiceRequestForm({required this.onSubmit, this.serviceRequest});

  @override
  _ServiceRequestFormState createState() => _ServiceRequestFormState();
}




class _ServiceRequestFormState extends State<ServiceRequestForm> {
  final _formKey = GlobalKey<FormState>();
  late String _clientName;
  late String _description;
  late String _location;
  late String _city = '';
  late String _country = '';
  late DateTime _dateTime = DateTime.now();

  Future<void> _getLocationData() async {
    try {
      final response = await http.get(Uri.parse('https://ipwho.is/'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _city = jsonData['city'];
          _country = jsonData['country'];
          _location = '${jsonData['city']}, ${jsonData['country']}';

          // Get current time from API
          final currentTime = jsonData['current_time'];
          if (currentTime != null) {
            _dateTime = DateTime.parse(currentTime);
          }
        });
      } else {
        // Handle error
        print('Failed to get location data');
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.serviceRequest != null) {
      _clientName = widget.serviceRequest!.clientName;
      _description = widget.serviceRequest!.description;

    } else {
      // Initialize with default values when creating a new request
      _clientName = '';
      _description = '';
      _dateTime = DateTime.now();
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ServiceRequest request = ServiceRequest(
        clientName: _clientName,
        description: _description,
        dateTime: _dateTime,
        location: _location,
      );
      widget.onSubmit(request);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: HomeAppBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Client Name'),
                initialValue: _clientName,
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter client name';
                  return null;
                },
                onSaved: (value) => _clientName = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Service Description'),
                initialValue: _description,
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter service description';
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                initialValue: _location,
                readOnly: true,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'City'),
                initialValue: _city,
                readOnly: true,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Country'),
                initialValue: _country,
                readOnly: true,
              ),
              // Add Date and Time Picker
              ListTile(
                title: Text("Date: ${DateFormat('yyyy-MM-dd').format(_dateTime)}"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != _dateTime) {
                    setState(() {
                      _dateTime = pickedDate;
                    });
                  }
                },
              ),
              ListTile(
                title: Text("Time: ${DateFormat('HH:mm').format(_dateTime)}"),
                onTap: () async {
                  // ... Time picker logic (can be removed if using API time)
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
