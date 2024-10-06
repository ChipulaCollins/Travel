import 'package:flutter/material.dart';
import 'package:travel/constants/constants.dart';


AppBar HomeAppBar = AppBar(
  title: const Text(
    "HelpMeHero",
    style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
  ),
  leading: PopupMenuButton<String>(
    onSelected: (value) {},
    icon: const Icon(Icons.menu),
    itemBuilder: (context) {
      return kAppBarMenuOptions
          .map((TechnicianDashboard) => PopupMenuItem<String>(
        value: TechnicianDashboard,
        child: SizedBox(
          width: 120,
          child: Text(
            TechnicianDashboard,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ))
          .toList();
    },
  ),
  actions: [
    IconButton(
      icon: const Icon(
        Icons.account_circle,
        size: 36,
      ),
      onPressed: () {},
    ),
  ],
);