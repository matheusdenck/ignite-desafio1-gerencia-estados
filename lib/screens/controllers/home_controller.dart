import '../../shared/models/todo_item.dart';
import 'gerencia_de_estado.dart';

class HomeController extends GerenciaDeEstado<List<ToDoItem>> {
  HomeController() : super(initialState: <ToDoItem>[]);

  final List<ToDoItem> _toDoItemList = <ToDoItem>[];
  final List<ToDoItem> _doneItemList = <ToDoItem>[];

  List<ToDoItem> get toDoItemList => _toDoItemList;
  List<ToDoItem> get doneItemList => _doneItemList;

  ///Add item to ToDo List
  void onAddItem(String itemTitle) {
    _toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
    setState(_toDoItemList);
  }

  ///Remove item from ToDo List
  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
    setState(_toDoItemList);
  }

  ///Remove item from ToDo List and add it to Done List
  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);
    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
    setState(_toDoItemList);
  }

  ///Remove item from Done List and add it to ToDo List
  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);
    _toDoItemList.add(
      ToDoItem(
        title: item.title,
      ),
    );
    setState(_doneItemList);
  }

  ///Remove item from Done List
  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);
    setState(_doneItemList);
  }
}
