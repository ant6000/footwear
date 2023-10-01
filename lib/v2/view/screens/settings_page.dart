import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';
import 'package:footwear/v2/view/widgets/setting_tile.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Consumer<ShowProductDetailsProvider>(builder: (context, provider, _) {
        //provider.checkedLoginorNot;
        return Column(
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.amber,
              // backgroundImage: provider.authModel!.profilePic == ''
              //     ? const AssetImage('images/snikers1.png') as ImageProvider
              //     : NetworkImage(provider.authModel!.profilePic),
            ),
            const SizedBox(height: 10),
            const Text(
              'Antor',
              style: TextStyle(fontSize: 30),
            ),
            const Text('antor@gmai.com', style: TextStyle(fontSize: 20)),
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
              onpress: () {},
            ),
          ],
        );
      }),
    );
  }
}
