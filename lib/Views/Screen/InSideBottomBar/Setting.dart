import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Controllers/InSideBottomBar/Setting.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingImp>(
        init: SettingImp(),
        builder: (controller) => Scaffold(
              backgroundColor: const Color(0xffEDEEF0),
              appBar: AppBar(
                backgroundColor: ColorsApp.white,
                title: const Text(
                  'Settings',
                  style: TextStyle(
                      color: ColorsApp.black, fontWeight: FontWeight.bold),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      /////////////////////////////////////start section account
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsApp.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    "https://ui-avatars.com/api/?name=${controller.user.name}&color=000000&background=f1f1ff", // Replace with your image URL
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.user.name!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Text('Account'),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.verified,
                                          color: Colors.blue,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /////////////////////////////////////end section account
                      const SizedBox(height: 20),
                      SettingsSection(
                        items: [
                          SettingsItem(
                            icon: Icons.person,
                            title: 'Personal settings',
                          ),
                          SettingsItem(
                            icon: Icons.account_circle,
                            title: 'Account settings',
                          ),
                          SettingsItem(
                            icon: Icons.verified_user,
                            title: 'Verification settings',
                          ),
                          SettingsItem(
                            icon: Icons.brightness_6,
                            title: 'Appearance settings',
                            last: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SettingsSection(
                        items: [
                          SettingsItem(
                            icon: Icons.notifications,
                            title: 'Notifications',
                          ),
                          SettingsItem(
                            icon: Icons.security,
                            title: 'Security',
                          ),
                          SettingsItem(
                            icon: Icons.phone,
                            title: 'Phone',
                          ),
                          SettingsItem(
                            icon: Icons.logout,
                            title: 'Log out',
                            last: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '2024 © Copyrights for kallcenter application',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class SettingsSection extends StatelessWidget {
  final List<SettingsItem> items;

  SettingsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.white,
      surfaceTintColor: ColorsApp.white,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0),
      // ),
      child: Column(
        children: items.map((item) => item).toList(),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  bool last = false;

  SettingsItem({required this.icon, required this.title, this.last = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle tap
          },
        ),
        !last
            ? Divider(
                color: ColorsApp.grey,
                endIndent: 20,
                height: 1,
                indent: 20,
                thickness: 1,
              )
            : SizedBox()
      ],
    );
  }
}
