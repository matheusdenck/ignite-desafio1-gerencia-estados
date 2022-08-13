import '../../shared/models/todo_item.dart';
import 'gerencia_de_estado.dart';

class HomeController extends GerenciaDeEstado<List<ToDoItem>> {
  HomeController() : super(initialState: <ToDoItem>[]);

  final List<ToDoItem> _toDoItemList = <ToDoItem>[];
  final List<ToDoItem> _doneItemList = <ToDoItem>[];

  List<ToDoItem> get toDoItemList => _toDoItemList;
  List<ToDoItem> get doneItemList => _doneItemList;

  void onAddItem(String itemTitle) {
    _toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
    setState(_toDoItemList);
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
    setState(_toDoItemList);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);
    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
    setState(_doneItemList);
  }
}
