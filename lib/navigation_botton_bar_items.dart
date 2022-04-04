import 'importe.dart';

class NavigationBottomBarItems extends StatefulWidget {

  final int index;
  const NavigationBottomBarItems({Key? key, required this.index}) : super(key: key);

  @override
  _NavigationBottomBarItemsState createState() => _NavigationBottomBarItemsState();
}

class _NavigationBottomBarItemsState extends State<NavigationBottomBarItems> {
  @override
  Widget build(BuildContext context) {

    var state = context.watch<TestProvider>();
    List<Widget> childi = [];
    for (var objekt in state.listi) {
      childi = [...childi, objekt.widgetErstellen()];
    }

    if (widget.index == 0) {
      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: state.spalten,
        children: childi,
      );
    } else {
      return const Center(
        child: StatistikAlle(),
      );
    }
  }
}
