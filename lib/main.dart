import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
final items = List<String>.generate(10000, (i) => '$i');

  @override
  Widget build(BuildContext context) {

    final ytcl = YoutubePlayerController(
      initialVideoId: "1qFGauSSfB8&t",
      params: const YoutubePlayerParams(
        playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'],
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white,),
        primaryIconTheme: const IconThemeData(color: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: YoutubePlayerControllerProvider(
        controller: ytcl,
        child:Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: const Icon(
              Icons.videocam,
          color: Colors.blue,
          ),
          title:  const Text(
              'PekoTube',
            style: TextStyle(color: Colors.blue,
            ),
        ),
          actions: <Widget>[
            SizedBox(
              width: 44,
              child: TextButton(
                child: const Icon(
                    Icons.search,
                color: Colors.blue),
                  onPressed: (){
                    // todo
                  },
              ),
            ),
            SizedBox(
              width: 44,
              child: TextButton(
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.blue,
                ),
                onPressed: (){
                  //todo
                },
              ),
            ),
          ],
      ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      child: Image.asset(
                        'images/pekorart_1.jpeg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Column(
                      children: <Widget>[
                         const Text(
                          'ぺこちゅーぶ！',
                          style: TextStyle(color: Colors.blue,),
                        ),
                        TextButton(
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.refresh,
                              color: Colors.red,),
                              Text('更新するぺこな'),
                            ],
                          ),
                          onPressed: ()
                          {
                            //todo
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Column(
                        children: const [
                          // iframe playerの再生画面枠組
                          YoutubePlayerIFrame(),
                          Padding(padding: EdgeInsets.all(0)),
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
