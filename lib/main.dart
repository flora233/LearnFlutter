// export PATH="$PATH:~/Downloads/flutter/bin"

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Amazon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){showSearch(context: context, delegate: ShopSearch());},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              
            ),
          ],
        ),
      ),
    );
  }
}

class ShopSearch extends SearchDelegate<String> {
  final foods = ['chips', 'oats', 'buffet', 'poke', 'sanwiches'];
  final recentFoods = ['salad', 'juice'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // show the right actions
    return [IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){},
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // the leading of the icons
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // search suggestions
    final suggestionList = query.isEmpty? recentFoods: foods;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.history),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }

}