import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema4u/api/api_connection.dart';
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
                style: TextStyle(color: AppColor.snow),
                cursorColor: AppColor.snow,
                autofocus: true,
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {});
                    },
                    color: AppColor.snow,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: multiSearch("batman"),
                builder: (context, snapShot) {
                  var data = snapShot.data;
                  return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: data[index].posterPath ?? 'No Image',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          title: Text(data[index].title ?? 'No Title'),
                          subtitle:
                              Text(data[index].originalTitle ?? 'No Subtitle'),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
