import 'package:flutter/material.dart';
import 'package:pekotube_app/video_deta_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
final items = List<String>.generate(10000, (i) => '$i');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white,),
      ),
      home:  Scaffold(
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
                          'PekoTube',
                          style: TextStyle(color: Colors.blue,),
                        ),
                        TextButton(
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.notifications,
                              color: Colors.red,),
                              Text('登録する'),
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onLongPress: () async{
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VideoDataPage()
                            ),
                          );
                      },
                      contentPadding: const EdgeInsets.all(8),
                      leading:Image.asset(
                        'images/pekorart_1.jpeg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Column(
                        children: [
                          Text(
                            '【ホロライブ切り抜き】ぺこすば大戦争' + items[index] + '話',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Text(
                                  '100回再生',
                              style: TextStyle(fontSize: 13),),
                              Text(items[index] +'日前'),
                            ],
                          )
                        ],
                      ),
                      trailing: const Icon(Icons.more_vert),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
