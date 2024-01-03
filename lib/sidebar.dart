import 'package:flutter/material.dart';
import 'men.dart';
import 'women.dart';
import 'kids.dart';
import 'wishlist.dart';
import 'login.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text('WOMEN', style: TextStyle(fontSize: 20),),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Women(),
                  )
              )
            },
          ),
          ListTile(
            title: const Text('MEN', style: TextStyle(fontSize: 20),),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Men(),
                  )
              )
            },
          ),
          ListTile(
            title: const Text('KIDS', style: TextStyle(fontSize: 20),),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Kids(),
                  )
              )
            },
          ),
          ListTile(
            title: const Text('SMART', style: TextStyle(fontSize: 20),),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('WISHLIST', style: TextStyle(fontSize: 20),),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Wishlist(),
                  )
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('LOGIN/REGISTER', style: TextStyle(fontSize: 20),),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  )
              )
            },
          ),
        ],
      ),
    );
  }
}
