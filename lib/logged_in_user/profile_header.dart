import 'package:flu_core_rest/flu_core_rest.dart';
import 'package:flu_datablocks/flu_datablocks.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../widgets/profile_image_view.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoggedInUserBuilder(
      locationInfo: getClassName(this),
      description: null,
      build: (FluLoggedInUser? user) {
        AppUserData? loginInfo = GlobalFlu.loggedInUser as AppUserData?;
        return _buildMain(loginInfo);
      },
    );
  }

  Widget _buildMain(AppUserData? loginInfo) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[150],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            ProfileImageView(
              imageUrl: loginInfo?.imageUrl,
              size: 90,
            ),
            const SizedBox(height: 8),
            Text(
              loginInfo?.fullName ?? "-",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              loginInfo?.email ?? "-",
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
