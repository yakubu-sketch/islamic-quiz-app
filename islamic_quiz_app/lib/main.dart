import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const IslamicQuizApp());
}

class IslamicQuizApp extends StatelessWidget {
  const IslamicQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B192C),
          primary: const Color(0xFF0B192C),
          secondary: const Color(0xFFD4AF37),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoginMode = true;

  void _submit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07101B),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E33),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFD4AF37), width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Color(0xFFD4AF37),
                    child: Icon(Icons.mosque, size: 36, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Islamic Quiz App',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Royal Blue & Gold Edition',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Color(0xFFD4AF37)),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD4AF37))),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD4AF37))),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(isLoginMode ? 'Sign In' : 'Register Account', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.g_mobiledata, size: 26, color: Color(0xFFD4AF37)),
                  label: const Text('Sign In with Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFD4AF37)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => setState(() => isLoginMode = !isLoginMode),
                  child: Text(
                    isLoginMode ? 'Need an account? Register here' : 'Already have an account? Sign In',
                    style: const TextStyle(color: Color(0xFFD4AF37)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int userXP = 50;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeTab(onSelect: () => setState(() => _currentIndex = 1)),
      QuizTab(currentXP: userXP, onUpdateXP: (xp) => setState(() => userXP = xp)),
      const LeaderboardTab(),
      const ProfileTab(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF07101B),
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final VoidCallback onSelect;
  const HomeTab({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07101B),
      appBar: AppBar(title: const Text('Islamic Categories'), backgroundColor: const Color(0xFF0B192C), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            tileColor: const Color(0xFF0F1E33),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.menu_book, color: Color(0xFFD4AF37)),
            title: const Text('Seerah & Prophets', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('Tap to start quiz session', style: TextStyle(color: Colors.white54, fontSize: 12)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFD4AF37), size: 16),
            onTap: onSelect,
          ),
        ],
      ),
    );
  }
}

class QuizTab extends StatefulWidget {
  final int currentXP;
  final ValueChanged<int> onUpdateXP;
  const QuizTab({super.key, required this.currentXP, required this.onUpdateXP});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  late int xp;
  bool showAd = false;
  bool adWatched = false;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    xp = widget.currentXP;
  }

  void _answer(bool correct) {
    setState(() {
      if (correct) xp += 10;
      widget.onUpdateXP(xp);
      showAd = true;
      adWatched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07101B),
      appBar: AppBar(
        title: const Text('Islamic Quiz Session'),
        backgroundColor: const Color(0xFF0B192C),
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('XP: $xp', style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F1E33),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
                  ),
                  child: const Text(
                    'Which city is known as the birthplace of Prophet Muhammad (PBUH)?',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _answer(false),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF162A45), foregroundColor: Colors.white),
                  child: const Text('A) Medina'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _answer(true),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF162A45), foregroundColor: Colors.white),
                  child: const Text('B) Makkah (Correct)'),
                ),
              ],
            ),
          ),
          if (showAd)
            Container(
              color: Colors.black.withOpacity(0.9),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F1E33),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFD4AF37), width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('MANDATORY INTERSTITIAL AD', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      const Icon(Icons.play_circle_filled, size: 50, color: Color(0xFFD4AF37)),
                      const SizedBox(height: 12),
                      const Text('Watch this ad fully to unlock your result & milestone progress.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () => setState(() => adWatched = true),
                        style: OutlinedButton.styleFrom(side: BorderSide(color: adWatched ? Colors.green : const Color(0xFFD4AF37))),
                        child: Text(adWatched ? 'Ad Watched ✓' : 'Tap to Watch Ad', style: TextStyle(color: adWatched ? Colors.green : const Color(0xFFD4AF37))),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: adWatched
                            ? () => setState(() {
                                  showAd = false;
                                  showResult = true;
                                })
                            : null,
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.black87),
                        child: const Text('Continue to Result'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07101B),
      appBar: AppBar(title: const Text('Leaderboard'), backgroundColor: const Color(0xFF0B192C), foregroundColor: Colors.white),
      body: const Center(child: Text('Top Scholars Leaderboard', style: TextStyle(color: Colors.white70))),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07101B),
      appBar: AppBar(title: const Text('Profile & Referral'), backgroundColor: const Color(0xFF0B192C), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(child: CircleAvatar(radius: 40, backgroundColor: Color(0xFFD4AF37), child: Icon(Icons.person, size: 45, color: Colors.black87))),
          const SizedBox(height: 14),
          const Text('Quiz Scholar', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E33),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.4)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Referral Code: DEEN-8842', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 6),
                Text('Earn 5% milestone bonus when friends join using your code!', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[800], foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
