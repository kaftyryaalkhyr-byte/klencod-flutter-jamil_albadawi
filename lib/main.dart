import 'package:flutter/material.dart';

void main() {
  runApp(const JamalApp());
}

class JamalApp extends StatelessWidget {
  const JamalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جميل البدوي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B4FE9)),
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final List<Widget> _tabs = const [
    Center(child: Text('الصفحة الرئيسية', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('الخدمات', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('حسابي', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('التقارير', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('المزيد', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _tabs,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        height: 68,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF5B4FE9).withOpacity(0.12),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.apps_rounded), label: 'الخدمات'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'حسابي'),
          NavigationDestination(icon: Icon(Icons.receipt_long_rounded), label: 'التقارير'),
          NavigationDestination(icon: Icon(Icons.more_horiz_rounded), label: 'المزيد'),
        ],
      ),
    );
  }
}