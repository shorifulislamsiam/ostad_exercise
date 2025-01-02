class Task {
  int? id;
  String? title;
  String? description;
  String? status;
  //List <String?> status =["Pending","Progress","Completed"];
  late DateTime dueDate;

  Task(this.id, this.title, this.status);

  //void add(Task task) {}
}

class TaskManager {
  List<Task> tasks = [];
  void addTask(Task task) {
    print("Which task you want to add ");
    tasks.add(task);
  }

  void updateTask(int id, String? newstatus) {
    for (var task in tasks) {
      if (task.id == id) {
        task.status = newstatus;
        return;
      }
    }
  }

  void listtask() {
    for (var task in tasks) {
      print('ID: ${task.id}, Title: ${task.title}, Status: ${task.status}');
    }
  }


}
main() {
  var taskManager = TaskManager();
  taskManager.addTask(Task(1, 'Task 1', 'Pending'));
  taskManager.addTask(Task(2, 'Task 2', 'In Progress'));
  print('All tasks:');
  taskManager.listtask();
  taskManager.updateTask(1, 'Completed');
  print('\nUpdated tasks:');
  taskManager.listtask();
}