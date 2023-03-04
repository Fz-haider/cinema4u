import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema 4u'),
      ),
      body: Center(
        child: Column(
          children: [
            //   Movies Section
            Card(
              elevation: 3,
              child: ListTile(
                tileColor: Color.fromARGB(255, 218, 175, 83),
                title: Text('Movies'),
                trailing: Text('Go'),
                onTap: () {},
              ),
            ),
            Row(
              children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      children: [
                        Image(image: AssetImage('introduction1.png')),
                        Row(
                          children: [Text('Title'), Icon(Icons.star)],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //   Series Section
            Card(
              elevation: 3,
              child: ListTile(
                tileColor: Color.fromARGB(255, 218, 175, 83),
                title: Text('Movies'),
                trailing: Text('Go'),
                onTap: () {},
              ),
            ),
            //   Bollywood Section
            Card(
              elevation: 3,
              child: ListTile(
                tileColor: Color.fromARGB(255, 218, 175, 83),
                title: Text('Movies'),
                trailing: Text('Go'),
                onTap: () {},
              ),
            ),
            //   Hollywood Section
            Card(
              elevation: 3,
              child: ListTile(
                tileColor: Color.fromARGB(255, 218, 175, 83),
                title: Text('Movies'),
                trailing: Text('Go'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
