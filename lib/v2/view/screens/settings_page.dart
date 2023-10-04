import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:footwear/v2/controller/provider/auth_provider.dart';
import 'package:footwear/v2/view/widgets/setting_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.amber,
              backgroundImage: provider.authModel?.profilePic != null
                  ? NetworkImage(provider.authModel?.profilePic ?? '')
                  : const AssetImage('images/default_profile_pic.png')
                      as ImageProvider,
            ),
            const SizedBox(height: 10),
            Text(
              provider.authModel?.name ?? '',
              style: const TextStyle(fontSize: 30),
            ),
            Text(provider.authModel?.email ?? '',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: const StadiumBorder()),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 30),
              child: Divider(),
            ),
            const SizedBox(height: 10),
            SettingsTile(
              title: 'Account Information',
              color: Colors.black,
              icon: Icons.person,
              endIcon: true,
              onpress: () {},
            ),
            SettingsTile(
              title: 'Shopping Address',
              color: Colors.black,
              icon: Icons.location_city,
              endIcon: true,
              onpress: () {},
            ),
            SettingsTile(
              title: 'Wishlist',
              color: Colors.black,
              icon: Icons.favorite,
              endIcon: true,
              onpress: () {},
            ),
            SettingsTile(
              title: 'Order History',
              color: Colors.black,
              icon: Icons.history,
              endIcon: true,
              onpress: () {},
            ),
            SettingsTile(
              title: 'Notifications',
              color: Colors.black,
              icon: Icons.notifications,
              endIcon: true,
              onpress: () {},
            ),
            SettingsTile(
              title: 'Cards',
              color: Colors.black,
              icon: Icons.credit_card_outlined,
              endIcon: true,
              onpress: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 30),
              child: Divider(),
            ),
            SettingsTile(
              title: 'About Apps',
              color: Colors.black,
              icon: Icons.abc,
              endIcon: true,
              onpress: () {},
            ),
            SettingsTile(
              title: 'Logout',
              color: Colors.red,
              icon: Icons.logout,
              endIcon: false,
              onpress: () {
                provider.logOut();
                Navigator.pushReplacementNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      );
    });
  }
}
