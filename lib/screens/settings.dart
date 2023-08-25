import 'package:flutter/material.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/provider/auth_provider.dart';
import 'package:footwear/widgets/setting_tile.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<UserModel?>(
            future: authprovider.showProfileInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                UserModel? user = snapshot.data;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:NetworkImage(user?.profilePic??''),
                      
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user?.name ?? '',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(user?.email ?? '',
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

                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Text('No user data available.');
              }
            },
          ),
                          const SizedBox(height: 10),
                const Divider(),
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
                const Divider(),
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
                    authprovider.logOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
        ],
      ),
    );
  }
}
