import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
class video_data_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //(1) コントローラーの初期化
    var ytcl = YoutubePlayerController(
      initialVideoId: "1qFGauSSfB8&t",
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //(2) YoutubePlayerControllerProviderでくるみます
        home: YoutubePlayerControllerProvider(
            controller: ytcl,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(color: Colors.blue),
                  title: const Text("Youtube Player"),
                ),
                body: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        //(3) プレーヤーiframeで再生枠を作ります
                        const YoutubePlayerIFrame(),
                        const Padding(padding: EdgeInsets.all(30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  //(4) コントローラーのメソッドで操作
                                  ytcl.play();
                                },
                                child: const Text("play")),
                            ElevatedButton(
                                onPressed: () {
                                  ytcl.pause();
                                },
                                child: const Text("pause")),
                          ],
                        )
                      ],
                    )
                )
            )
        )
    );
  }
}
