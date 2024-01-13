import 'package:flutter/material.dart';
import 'package:hockey/theme/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Profil'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.accent,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pers.png'),
                        radius: 25,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'username@gmail.com',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.whiteWithOpacity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'éditer',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildSubscriptionCard(),
            SizedBox(height: 30),
            _buildParam('assets/icons/Notes.png',
                'Mes notes', 'https://google.com'),
            SizedBox(height: 10),
            _buildParam('assets/icons/Like.png',
                'Actualités préférées', 'https://google.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildParam(String icon, String text, String uri) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(uri);
        await launchUrl(url);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Row(
            children: [
              Image.asset(
                icon,
              ),
              SizedBox(width: 15),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.accent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(
            'Abonnement à l\'App',
            maxLines: 1,
            style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            '\nAccédez à vos actualités préférées et prenez des notes pendant la diffusion.',
            style: TextStyle(color: AppColors.white, fontSize: 12),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Text(
              '12\$/month',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
