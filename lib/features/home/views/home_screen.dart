import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/home/widgets/welcome_header.dart';
import 'package:voyga/features/home/widgets/search_card.dart';
import 'package:voyga/features/home/widgets/mood_chips_row.dart';
import 'package:voyga/features/home/widgets/secret_deals_button.dart';
import 'package:voyga/features/home/widgets/destinations_section.dart';
import 'package:voyga/features/home/widgets/dark_banner_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: const SingleChildScrollView(
          padding: EdgeInsets.only(top: 80, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Welcome Back, Ali',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkText,
                ),),
              ),
              SizedBox(height: 24),
              SearchCard(),
              SizedBox(height: 28),
              MoodChipsRow(),
              SizedBox(height: 24),
              SecretDealsButton(),
              SizedBox(height: 32),
              DestinationsSection(),
              SizedBox(height: 28),
              DarkBannerCard(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
