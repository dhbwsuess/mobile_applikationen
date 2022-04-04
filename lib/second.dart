import 'importe.dart';

class  Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  var state = context.watch<TestProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => state.changeMode(),
              child: const Icon(Icons.nightlight_round),
            ),
            InkWell(
              onTap: () => state.changeColumnNumber(),
              child: const Icon(Icons.view_column),
            ),
          ],
        ),
      ),
      body: NavigationBottomBarItems(index: state.index),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NeuesThemaErstellen(),),
        ),
        child: const Icon(Icons.add),
        tooltip: "Neues Thema erstellen",
      ),
      drawer: Drawer(
        child: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName)),
            child: const Text("Ausloggen"),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: "Themen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Statistik"
          ),
        ],
        currentIndex: state.index,
        onTap: (int idx) {
          state.index = idx;
          state.updateProvider();
        },
      ),
    );
  }
}
