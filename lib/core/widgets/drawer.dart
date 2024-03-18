import 'package:ebook_task_admin/core/theming/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final List<DrawerItem> drawerItems;
  final void Function()? onTap;
  const CustomDrawer({super.key, required this.drawerItems, this.onTap});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.transparent)),
      child: Column(
        children: [
          const DrawerHeader(child: Icon(Icons.supervised_user_circle_sharp)),
          ...List.generate(
            widget.drawerItems.length,
            (index) => ListTile(
              leading: Icon(widget.drawerItems[index].icon),
              title: Text(widget.drawerItems[index].label),
              onTap: () => setState(() {
                _selectedIndex = index;
                widget.onTap;
              }),
              selected: _selectedIndex==index,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String label;
  final IconData icon;

  DrawerItem({required this.label, required this.icon});
}
