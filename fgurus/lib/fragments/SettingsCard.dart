import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String location;
  final Icon icon;
  final Widget? trailing;

  const SettingsCard({
    super.key,
    required this.title,
    required this.location,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {
        Navigator.pushNamed(context, location);
      },
    );
  }
}
