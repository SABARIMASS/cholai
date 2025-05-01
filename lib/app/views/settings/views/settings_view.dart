import 'package:cholai/app/core/helpers/image_helper.dart';
import 'package:cholai/app/views/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // Navigate to help page or show dialog
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildProfileSection(),
          const Divider(),
          _buildSettingSection("Account", [
            _buildSettingItem(
              context,
              "Privacy",
              Icons.lock,
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            _buildSettingItem(
              context,
              "Security",
              Icons.security,
              onTap: () {
                // Navigate to security settings
              },
            ),
          ]),
          const Divider(),
          _buildSettingSection("Notifications", [
            _buildSettingSwitch(
              context,
              "Push Notifications",
              Icons.notifications,
              true,
              (value) {
                // Handle notification toggle
              },
            ),
            _buildSettingSwitch(
              context,
              "Message Sound",
              Icons.notifications_active,
              false,
              (value) {
                // Handle sound toggle
              },
            ),
          ]),
          const Divider(),
          _buildSettingSection("General", [
            _buildSettingItem(
              context,
              "Language",
              Icons.language,
              onTap: () {
                // Change language
              },
            ),
            _buildSettingItem(
              context,
              "Theme",
              Icons.brightness_6,
              onTap: () {
                // Change theme
              },
            ),
          ]),
          const Divider(),
          _buildSettingSection("Help & Feedback", [
            _buildSettingItem(
              context,
              "FAQ",
              Icons.help_outline,
              onTap: () {
                // Show FAQ page
              },
            ),
            _buildSettingItem(
              context,
              "Contact Support",
              Icons.mail,
              onTap: () {
                // Navigate to support page or open contact options
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          ImageHelper.networkImageFullUrl(
            controller.userService.userInfo.value.profileImage ?? "",
          ),
        ),
      ),
      title: Text(controller.userService.userInfo.value.name ?? ""),
      subtitle: Text(controller.userService.userInfo.value.about ?? ""),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          // Navigate to edit profile page
        },
      ),
    );
  }

  Widget _buildSettingSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    String title,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _buildSettingSwitch(
    BuildContext context,
    String title,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
