import 'package:dactest/ui/components/back_button.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  //TODO: Dummy list
  final List<String> searchList = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Fig"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => {
         //TODO: Implement filter logic
        },
        icon: const Icon(Icons.filter_list_outlined),
      ),
      IconButton(
        onPressed: () => {
          if (query.isEmpty) {
            close(context, '')
          } else {
            query = ''
          }
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const GoBackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = searchList.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]),
            onTap: (){
              //TODO: Handle the selected search result
              close(context, searchResults[index]);
            },
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionsList = query.isEmpty
        ? []
        : searchList.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionsList[index]),
          onTap: (){
           query = suggestionsList[index];
           //TODO: Show the search results based on the selected suggestion
          },
        );
      }
    );
  }

}