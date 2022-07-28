import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TaskStates {}

class TaskInitialStates extends TaskStates {}

class AppDatabaseInitialized extends TaskStates {}

class CreateDatabaseStates extends TaskStates {}

class InsertDatabaseStates extends TaskStates {}

class AppDatabaseUserCreated extends TaskStates {}

class GetDateFromDatabaseStates extends TaskStates {}

class UpdateTaskStates extends TaskStates {}

class DeleteTaskStates extends TaskStates {}
