import 'package:flutter/material.dart';

class AddNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddNoteAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('Add note'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
