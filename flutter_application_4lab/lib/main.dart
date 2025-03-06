import 'package:flutter/material.dart';
import 'gridView.dart';
import 'listview.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  //басталу нүктесі
  runApp(MyApp()); //классты іске қосу
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //флаттер қолданбаны құру үшін
      title: 'Flutter Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // бастыэкран ретінде класс орнатады
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //екі таб бар екені көрсетеді
      child: Scaffold(
        appBar: AppBar(
          // жолақ
          title: Text('Flutter Lab'),
          bottom: TabBar(
            tabs: [
              // екі қойынды
              Tab(text: 'ListView'),
              Tab(text: 'GridView'),
            ],
          ),
        ),
        drawer: AppDrawer(), //жанама мәзір
        body: TabBarView(
          // қойындылар арасындағы мазмұнды ауыстырады
          children: [
            ListViewExample(),
            GridViewExample(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // экранның төменгі бұрышындағы қалқымалы батырма
          onPressed: () {
            // Task 6: Отображение Toast уведомления
            Fluttertoast.showToast(
              msg: "Hello, Flutter!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// Task 2: ListView-10 элементы
class ListViewExample extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    //он элементі бар тізім
    10,
    (index) => {
      "title": "Item ${index + 1}",
      "subtitle": "Subtitle ${index + 1}",
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //элем динамикалық түрде құру
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          //әр элем листтитл арқылы көрсетеді
          title: Text(items[index]["title"]!),
          subtitle: Text(items[index]["subtitle"]!),
          leading: Icon(Icons.label),
        );
      },
    );
  }
}

// Task 3: GridView-6 контейнеры
class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //үш бағаннан тұратын топ құру
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      },
    );
  }
}

// Task 4: Card Widgets экран виджетами
class CardScreen extends StatelessWidget {
  final List<Map<String, String>> cards = List.generate(
    4,
    (index) => {
      "title": "Card ${index + 1}",
      "description": "This is the description of card ${index + 1}.",
      "image": "https://via.placeholder.com/150"
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards")),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: cards.map((card) {
          return Card(
            //кесте ішінде жеке блоктар бар
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(card["image"]!),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card["title"]!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(card["description"]!),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Task 5: Drawer с меню
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // ✅ Убираем лишний отступ
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 80, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "User Name",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
