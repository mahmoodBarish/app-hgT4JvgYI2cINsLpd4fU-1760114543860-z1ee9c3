import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/244_424.png',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 5),
                  // Using a standard icon as a placeholder for the custom grocery icon
                  const Icon(
                    Icons.local_grocery_store,
                    color: Color(0xFF53B175),
                    size: 56,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome\nto our store',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Get your groceries in as fast as one hour',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/home_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}