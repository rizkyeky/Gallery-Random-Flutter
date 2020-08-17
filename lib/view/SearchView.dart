import 'package:flutter/material.dart';
import 'package:gallery/controller/SearchBloc.dart';
import 'View.dart';


class SearchView extends View<SearchBloc> {
  
  final List<String> list = List.generate(10, (index) => "Text $index");

  SearchView({Key key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    print("build searchView");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6),
                child: TextField(
                  focusNode: _searchNode, 
                  controller: _searchController,
                  onSubmitted:(value) {

                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white
                  ),
                ),
              )
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.switchSearch();
          if (_searchNode.hasFocus) _searchNode.unfocus();
          else _searchNode.requestFocus();
        },
        elevation: 0,
        highlightElevation: 0,
        child: StreamBuilder<bool>(
          initialData: false,
          stream: bloc.searchStream,
          builder: (context, snapshot) => AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            child: (snapshot.data) ? Icon(Icons.close) : Icon(Icons.search),
          )
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}

// class Search extends SearchDelegate {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//         icon: Icon(Icons.close),
//         onPressed: () {
//           query = "";
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }

//   String selectedResult = "";

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text(selectedResult),
//       ),
//     );
//   }

//   final List<String> listExample;
//   Search(this.listExample);

//   List<String> recentList = ["Text 4", "Text 3"];

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestionList = [];
//     query.isEmpty
//         ? suggestionList = recentList //In the true case
//         : suggestionList.addAll(listExample.where(
//             // In the false case
//             (element) => element.contains(query),
//           ));

//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(
//             suggestionList[index],
//           ),
//           leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
//           onTap: (){
//             selectedResult = suggestionList[index];
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }