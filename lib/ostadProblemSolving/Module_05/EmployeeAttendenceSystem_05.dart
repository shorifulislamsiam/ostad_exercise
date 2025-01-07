import 'dart:collection';

class Employee{
  int? id;
  String? name;
  String? designation;
  Map<DateTime, String> attendance ={};
  Employee(this.id, this.name, this.designation);

  void markAttendance(DateTime datetime, String status){
    if(status != "Present" && status !="Absent"){
      throw ArgumentError('Invalid status. Use "Present" or "Absent".');
    }
    attendance[datetime] = status;
  }

  void viewAttendance(){
    attendance.forEach((datetime, status){
      print("Date: $datetime, Status: $status");
    });
  }

  double? attendancePercentage(){
    if (attendance.isEmpty){
      return 0;
    }
    int presentDays =attendance.values.where((status)=>status == "Present").length;
    return (presentDays / attendance.length) * 100;
  }
}

class AttendanceSystem{
  Set<int> employeeIds = HashSet();
  Map<int, Employee> employees ={};

  void addEmployee(int id,String name,String designation){
    if(employeeIds.contains(id)){
      throw ArgumentError("Duplicate Employee Id");
    }
    employeeIds.add(id);
    employees[id]= Employee(id, name, designation);
  }

  void MarkAttendance(int id, DateTime datetime, String status){
    try{
      Employee? employee = employees[id];
      employee?.markAttendance(datetime, status);
    }catch(e){
      print(e);
    }
  }
  void viewAttendance(int id){
    try{
      Employee? employee = employees[id];
      employee?.viewAttendance();
    }catch(e){
      print(e);
    }
  }
  double?  attendancePercentage(int id){
    try{
      Employee? employee=employees[id];
      return employee?.attendancePercentage() ?? 0;
    }catch(e){
      print(e);
      return 0;
    }
  }
}


void main(){
  AttendanceSystem attendanceSystem = AttendanceSystem();
  attendanceSystem.addEmployee(1, 'John Doe', 'Developer');
  attendanceSystem.MarkAttendance(1, DateTime(2025, 1, 7), 'Present');
  attendanceSystem.MarkAttendance(1, DateTime(2025, 1, 8), 'Absent');

  print('Attendance history for employee 1:');
  attendanceSystem.viewAttendance(1);
  print('Attendance percentage for employee 1: ${attendanceSystem.attendancePercentage(1)}%');
}