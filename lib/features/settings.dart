import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Service Categories
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Default Service Categories'),
            onTap: () {
              // Navigate to service categories settings
            },
          ),
          // Notification Settings
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          // Language Preferences
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Navigate to language settings
            },
          ),
          const Divider(),
          // User Profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () {
              // Navigate to user profile settings
            },
          ),
          // Roles and Permissions
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Roles and Permissions'),
            onTap: () {
              // Navigate to roles and permissions settings
            },
          ),
          // More settings can be added here
        ],
      ),
    );
  }
}