import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.vulcan,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cinema4u'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.snow),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                autofocus: true,
                controller: searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
