import 'package:flutter/material.dart';

import 'screens/controllers/builder_widget.dart';
import 'screens/controllers/home_controller.dart';
import 'screens/done_screen.dart';
import 'screens/task_screen.dart';
import 'shared/models/todo_item.dart';

class HomePage extends StatefulWidget {
  final HomeController controller = HomeController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  var _selectedIndex = 0;

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuilderWidget<List<ToDoItem>>(
        controller: widget.controller,
        builder: (context, state) => PageView(
          controller: _pageViewController,
          children: <Widget>[
            TaskScreen(
              itemList: widget.controller.toDoItemList,
              onAddItem: widget.controller.onAddItem,
              onCompleteItem: widget.controller.onCompleteItem,
              onRemoveItem: widget.controller.onRemoveToDoItem,
            ),
            DoneScreen(
              itemList: widget.controller.doneItemList,
              onRemoveItem: widget.controller.onRemoveDoneItem,
              onResetItem: widget.controller.onResetItem,
            ),
          ],
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          _pageViewController.animateToPage(
            _selectedIndex,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Concluídas',
          ),
        ],
      ),
    );
  }
}
