import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KVKK'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Menü'),
            ),
            _buildListTile(context, 'Haberler', '/news'),
            _buildListTile(context, 'Veri Ekle', '/products'),
            _buildListTile(context, 'Kullanıcı Ekle', '/users'),
            _buildListTile(context, 'Hakkımızda', '/about'),
            _buildListTile(context, 'Sakın Bakma', '/error'),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                _buildElevatedButton(context, 'Haberler', '/news'),
                const SizedBox(height: 16),
                _buildElevatedButton(context, 'Veri ekle', '/products'),
                const SizedBox(height: 16),
                _buildElevatedButton(context, 'Kullanıcı Ekle', '/users'),
                const SizedBox(height: 16),
                _buildElevatedButton(context, 'Hakkımızda', '/about'),
                const SizedBox(height: 16),
                _buildElevatedButton(context, 'Sakın Bakmaa :)', '/error'),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildListTile(
      BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        GoRouter.of(context).push(route);
        Navigator.pop(context);
      },
    );
  }

  static Widget _buildElevatedButton(
      BuildContext context, String label, String route) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).push(route);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
