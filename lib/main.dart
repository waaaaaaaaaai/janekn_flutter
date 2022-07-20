import 'dart:math';

import 'package:flutter/material.dart';

//まず呼ばれるところ
void main() {
  runApp(const MyApp()); //２番目に呼ばれるので、その中のMyAppが表示される
}

//ここが呼ばれてその中のHome＝JankenPageが呼ばれる
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(), //ここが呼ばれてる
    );
  }
}

//と言うわけでここが呼ばれている
class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String cpuHand = '✊';
  String result = '引き分け';

//選んだ手を出力するメソッド（関数）
  void selectHand(String selectedHand) {
    myHand = selectedHand; //変数mayHandに✊を入れる
    generateComputerHand(); //コンピューターの手を絵文字で表示するメソッド
    judge(); //結果判定の文字表示メソッド
    setState(() {}); //更新情報を表示させる
  }

//コンピュータがランダムで出すメソッド
  void generateComputerHand() {
    final randomNumber = Random().nextInt(3); //3を与えることで(0,1,2)のどれかがランダムで出る
    cpuHand = randomNumberToHand(
        randomNumber); //cpuHandの変数にメソッドで作ったランダムの数字を絵文字に変換したものを入れる
  }

//generateComputerHandで出た数字を絵で実体表示するメソッド
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  void judge() {
    if (cpuHand == myHand) {
      result = '引き分け';
    } else if (myHand == '✊' && cpuHand == '✌️') {
      //3つのパターンを||でまたはにすることでコードを省略できる
      result = '勝ち';
    } else if (myHand == '✌️' && cpuHand == '✋') {
      result = '勝ち';
    } else if (myHand == '✋' && cpuHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        //bodyの中央揃え
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Row横並び・Column縦並び
          children: [
            //結果文字の出力
            Text(
              result,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 32,
            ),

            //コンピューターの手を表示
            Text(
              cpuHand,
              style: TextStyle(
                fontSize: 46,
              ),
            ),
            SizedBox(
              height: 32,
            ),

            //自分の手を表示
            Text(
              myHand,
              style: TextStyle(
                fontSize: 46,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に中央揃え
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('✊');
                    // myHand = '✊'; //変数mayHandに✊を入れる
                    // print('✊'); //デバックコンソールに表示させる
                    // setState(() {}); //更新情報を表示させる
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');

                    // myHand = '✌️';
                    // print('✌️');
                    // setState(() {});
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✋');

                    // myHand = '✋';
                    // print('✋');
                    // setState(() {});
                  },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
