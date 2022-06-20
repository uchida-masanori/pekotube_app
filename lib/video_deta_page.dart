import 'package:flutter/material.dart';

class VideoDatailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => '$i');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
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
                        onPressed: () {
                          //todo　押下された時の挙動がここ。
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
                    onLongPress: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            VideoDatailPage()
                        ),
                      );
                    },
                    contentPadding: const EdgeInsets.all(8),
                    leading: Image.asset(
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
                            Text(items[index] + '日前'),
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
    );
  }
}
