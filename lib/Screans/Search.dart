import 'package:flutter/material.dart';

import '../static/Post.dart';
import '../static/PostSearch.dart';

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query="";
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return PostSearch(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search...'),);
  }
  
}