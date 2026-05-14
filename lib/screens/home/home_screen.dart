import 'package:flutter/material.dart';
import 'package:voyga/screens/home/widgets/curated_collections.dart';
import 'package:voyga/screens/home/widgets/hero_section.dart';
import 'package:voyga/screens/home/widgets/home_header.dart';
import '../../themes/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              HomeHeader(),
              SizedBox(height: 10),
              HeroSection(),
              SizedBox(height: 40),
              CuratedCollections(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

