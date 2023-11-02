import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/domain/todo_model_login.dart'; // Importa el modelo de tarea
import 'package:app/domain/todo_model_singup.dart'; 
import 'package:app/application_state/todo_state.dart'; 
import 'package:app/application_state/todo_event.dart'; 
import 'package:uuid/uuid.dart'; // Importa la biblioteca para generar identificadores únicos

// Define el notifier para gestionar el estado de las tareas
class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(TodoState.empty()); // Inicializa el estado del notifier con una lista de tareas vacía

  final uuid = const Uuid(); // Crea una instancia de Uuid para generar IDs únicos

  // Esta función se utiliza para mapear eventos a cambios en el estado
  void mapEventsToState(SingupEvent event) async {
    event.map(
      // Cambia el nombre de usuario en el estado
      todoUsernameChanged: (todoUsernameChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: todoUsernameChangedEvent.text.trimLeft(), fullname: state.todo.fullname, password: state.todo.password, country: state.todo.country, province: state.todo.province, city: state.todo.city, email: state.todo.email, age: state.todo.age, isTodoCompleted: false, 
          ),
        );
      },
      // Cambia el nombre completo en el estado
      todoFullnameChanged: (todoFullnameChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: todoFullnameChangedEvent.text.trimLeft(), password: state.todo.password, country: state.todo.country, province: state.todo.province, city: state.todo.city, email: state.todo.email, age: state.todo.age, isTodoCompleted: false, 
          ),
      );
      }, 
      // Cambia la clave en el estado
      todoPasswordChanged: (todoPasswordChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: state.todo.fullname, password: todoPasswordChangedEvent.text.trimLeft(), country: state.todo.country, province: state.todo.province, city: state.todo.city, email: state.todo.email, age: state.todo.age, isTodoCompleted: false, 
          ),
      );
      }, 
      // Cambia el edad en el estado
      todoAgeChanged: (todoAgeChangedEvent) { 
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: state.todo.fullname, password: state.todo.password, country: state.todo.country, province: state.todo.province, city: state.todo.city, email: state.todo.email, age: todoAgeChangedEvent.text.trimLeft(), isTodoCompleted: false, 
          ),
      );
      },
      // Cambia el pais en el estado
      todoCountryChanged: (todoCountryChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: state.todo.fullname, password: state.todo.password, country: todoCountryChangedEvent.text.trimLeft(), province: state.todo.province, city: state.todo.city, email: state.todo.email, age: state.todo.age, isTodoCompleted: false, 
          ),
        );
      },
      // Cambia la provincia en el estado
      todoProvinceChanged: (todoProvinceChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: state.todo.fullname, password: state.todo.password, country: state.todo.country, province: todoProvinceChangedEvent.text.trimLeft(), city: state.todo.city, email: state.todo.email, age: state.todo.age, isTodoCompleted: false, 
          ),
      );
      },
      // Cambia la ciudad en el estado
      todoCityChanged: (todoCityChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: state.todo.fullname, password: state.todo.password, country: state.todo.country, province: state.todo.province, city: todoCityChangedEvent.text.trimLeft(), email: state.todo.email, age: state.todo.age, isTodoCompleted: false, 
          ),
      );
      },  
      // Cambia el email en el estado
      todoEmailChanged: (todoEmailChangedEvent) {
        state = state.copyWith(
          todo: TodoModelSing( id_usuario: state.todo.id_usuario, username: state.todo.username, fullname: state.todo.fullname, password: state.todo.password, country: state.todo.country, province: state.todo.province, city: state.todo.city, email: todoEmailChangedEvent.text.trimLeft(), age: state.todo.age, isTodoCompleted: false, 
          ),
      );
      },

      // Cuando se agrega una nueva tarea
      addTodo: (addTodoEvent) {
        final List<TodoModelSing> todoList = [...state.todoList]; // Crea una copia de la lista de tareas actual
        todoList.add(
          TodoModelSing(
            id_usuario: uuid.v1(), // Genera un nuevo ID único para la tarea
            username: state.todo.username,
            fullname: state.todo.fullname,
            password: state.todo.password,
            country: state.todo.country,
            province: state.todo.province,
            city: state.todo.city,
            email: state.todo.email,
            age: state.todo.age,
            isTodoCompleted: false, // Inicializa como no completada
          ),
        );
        state = state.copyWith(todoList: todoList); // Actualiza el estado con la nueva lista de tareas
      },
    );
  }
}


///Clase para busqueda
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState.empty());

  void mapEventsToState(LoginEvent event) {
    event.map(
      // Cambia el nombre de usuario en el estado
      loginUsernameChanged: (todoUsernameChangedEvent) {
        state = state.copyWith(
          todo: TodoModelLogin( usernameLogin: todoUsernameChangedEvent.text.trimLeft(), passwordLogin: state.todo.passwordLogin, isTodoCompleted: false, 
          ),
        );
      },
      // Cambia la clave en el estado
      loginPasswordlChanged: (todoPasswordChangedEvent) {
        state = state.copyWith(
          todo: TodoModelLogin( usernameLogin: state.todo.usernameLogin, passwordLogin: todoPasswordChangedEvent.text.trimLeft(), isTodoCompleted: false, 
          ),
      );
      },
      addTodoLogin: (addTodoEvent) {
        final List<TodoModelLogin> loginList = [...state.loginList]; // Crea una copia de la lista de tareas actual
        loginList.add(
          TodoModelLogin(
            usernameLogin: state.todo.usernameLogin,
            passwordLogin: state.todo.passwordLogin,
            isTodoCompleted: false, // Inicializa como no completada
          ),
        );
        state = state.copyWith(loginList: loginList); // Actualiza el estado con la nueva lista de tareas
      },
    );
  }
}