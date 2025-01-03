class Task {
  int? id;
  String? title;
  String? description;
  String? status;
  //List <String?> status =["Pending","Progress","Completed"];
  DateTime dueDate;

  Task(this.id, this.title, this.status, this.dueDate);

  //void add(Task task) {}
}

class TaskManager {
  List<Task> tasks = [];
  void addTask(Task task) {
    print("Which task you want to add ");
    tasks.add(task);
  }

  void updateTask(int id, String? newstatus, DateTime newDueDate) {
    try{
      for (var task in tasks) {
        if (task.id == id) {
          task.status = newstatus;
          task.dueDate = newDueDate;
          return;
        }
      }
    }catch(e){
      print(e);
    }
  }
  List<Task> showDueDate(){
    return tasks.where((task) => task.dueDate.isBefore(DateTime.now())).toList();
  }

  void listtask() {
    for (var task in tasks) {
      print('ID: ${task.id}, Title: ${task.title}, Status: ${task.status}, DateTime:${task.dueDate}');
    }
  }



}
main() {
  var taskManager = TaskManager();
  taskManager.addTask(Task(1, 'Task 1', 'Pending', DateTime(2025,01,02)));
  taskManager.addTask(Task(2, 'Task 2', 'In Progress',DateTime(2025,01,02)));
  print('All tasks:');
  taskManager.listtask();
  taskManager.updateTask(1, 'Completed',DateTime(26,12,5));
  print('\nUpdated tasks:');
  taskManager.listtask();
}