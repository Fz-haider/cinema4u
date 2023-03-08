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
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Search Section
          Container(

          ),
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
          Container(
            height: 200,
            child: Card(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                  child: Column(children: [
                    Icon(Icons.add),
                  ]),
                ),
              ),
            ),
          ),

          //   Series Section
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Color.fromARGB(255, 218, 175, 83),
              title: Text('Series'),
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
    );
  }
}
