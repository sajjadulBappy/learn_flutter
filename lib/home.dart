import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Responsive Layout")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Tablet or large screen layout
            return Row(
              children: [
                Expanded(child: SidebarWidget()),
                Expanded(flex: 4, child: ContentWidget()),
              ],
            );
          } else {
            // Mobile or small screen layout
            return ContentWidget();
          }
        },
      ),
    );
  }

}


class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Main Content Area',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'This is where the main content of the app goes. You can display text, images, lists, forms, or any other widgets here.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          // Example of a list of items
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.label),
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Description of item ${index + 1}.'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class SidebarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Fixed width for the sidebar
      color: Colors.blueGrey[800], // Background color of the sidebar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle navigation or any action
              Navigator.of(context).pushNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle navigation or any action
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle navigation or any action
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle navigation or any action
              Navigator.of(context).pushNamed('/about');
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ],
      ),
    );
  }
}
