import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutterlistdemo/second.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
        body: new Center(
          //child: new Text('Hello World'),
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() {
    return RandomWordState();
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _fontStyle = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  void _pushSave() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return MyAppBar();
    }));
    /*  final titles = _saved.map((pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _fontStyle,
          ),
        );
      });
      final divided =
          ListTile.divideTiles(tiles: titles, context: context).toList();

      return Scaffold(
        appBar: new AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));*/
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ListDemo"),
          actions: [
            new IconButton(icon: Icon(Icons.list), onPressed: _pushSave)
          ],
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    const listPadding = 16.0;
    return
      // Text("My Value",style :TextStyle(height: 8)),
      ListView.builder(
          padding: const EdgeInsets.all(listPadding),
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return new Divider();
            } else {
              final index = i ~/ 2;
              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
              }
              return _buildRow(_suggestions[index]);
            }
          },
        );



  }

  /// 根据WordPair生成没一个item
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _fontStyle,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
