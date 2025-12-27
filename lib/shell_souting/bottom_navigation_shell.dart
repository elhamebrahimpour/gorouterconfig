import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationShell extends StatelessWidget {
  final Widget child;
  final String location;
  const BottomNavigationShell({
    super.key,
    required this.child,
    required this.location,
  });

  int _checkSelectedIndex(String location) {
    if (location.startsWith('/musics')) return 0;
    if (location.startsWith('/favorites')) return 1;
    if (location.startsWith('/profile')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0;
  }

  List<BottomNavigationBarItem> get _buildNavItems {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'musics'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorites'),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_off_outlined),
        label: 'profile',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _checkSelectedIndex(location),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/musics');
              break;
            case 1:
              context.go('/favorites');
              break;
            case 2:
              context.go('/profile');
              break;
            case 3:
              context.go('/settings');
              ();
              break;

            default:
          }
        },
        items: _buildNavItems,
      ),
    );
  }
}
