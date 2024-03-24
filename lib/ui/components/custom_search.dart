import 'package:dactest/data/models/user.dart';
import 'package:dactest/ui/components/back_button.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<UserModel> {
  //TODO: Dummy list
  final List<UserModel> searchList;

  CustomSearchDelegate(this.searchList);

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
            close(context, Null as UserModel)
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
    final List<UserModel> searchResults = searchList.where((item) => item.username.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index].username),
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
    final List<UserModel> suggestionsList = query.isEmpty
        ? []
        : searchList.where((item) => item.username.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionsList[index].username),
          onTap: (){
           query = suggestionsList[index].username;
           //TODO: Show the search results based on the selected suggestion
           close(context, suggestionsList[index]);
          },
        );
      }
    );
  }

}