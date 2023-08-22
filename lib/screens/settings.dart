import 'package:flutter/material.dart';
import 'package:footwear/widgets/setting_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage('images/antor.png'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Antor Chakraborty',
                style: TextStyle(fontSize: 30),
              ),
              const Text('antor@gmail.com', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: const StadiumBorder()),
                  child: Text('Edit Profile',style: TextStyle(
                    fontSize: 25
                  ),),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              SettingsTile(title: 'Account Information',color: Colors.black,icon: Icons.person,endIcon: true,onpress: () {},), 
              SettingsTile(title: 'Shopping Address',color: Colors.black,icon: Icons.location_city,endIcon: true,onpress: () {},), 
              SettingsTile(title: 'Wishlist',color: Colors.black,icon: Icons.favorite,endIcon: true,onpress: () {},), 
              SettingsTile(title: 'Order History',color: Colors.black,icon: Icons.history,endIcon: true,onpress: () {},), 
              SettingsTile(title: 'Notifications',color: Colors.black,icon: Icons.notifications,endIcon: true,onpress: () {},), 
              SettingsTile(title: 'Cards',color: Colors.black,icon: Icons.credit_card_outlined,endIcon: true,onpress: () {},), 
              const Divider(),
              SettingsTile(title: 'About Apps',color: Colors.black,icon: Icons.abc,endIcon: true,onpress: () {},), 
              SettingsTile(title: 'Logout',color: Colors.red,icon: Icons.logout,endIcon: false,onpress: () {},), 
            ],
          ),
        ),
      ),
    );
  }
}
