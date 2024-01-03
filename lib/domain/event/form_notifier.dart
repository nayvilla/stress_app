

import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/domain/model/todo_model.dart'; // Importa el modelo de tarea
import 'package:riverpod_app/domain/event/form_state.dart'; //Manejo de estado 
import 'package:riverpod_app/domain/event/form_event.dart'; //import 'package:todo_list_riverpod/application/todo/todo_event.dart'; 


// Define el notifier para gestionar el estado de las tareas
class FormNotifier extends StateNotifier<FormState> {
  FormNotifier() : super(FormState.empty()); // Inicializa el estado del notifier con una lista de tareas vacía

  // Esta función se utiliza para mapear eventos a cambios en el estado
  void mapEventsToState(FormEvent event) async {
    event.map(
      // Actualiza el esatdo del dropdown de la pregunta 1
      formPregunta1Changed: (formPregunta1ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: formPregunta1ChangedEvent.text.trimLeft(), 
            pregunta2: state.form.pregunta2, 
            pregunta3: state.form.pregunta3, 
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5, 
            pregunta6: state.form.pregunta6,  
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 2
      formPregunta2Changed: (formPregunta2ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: formPregunta2ChangedEvent.text.trimLeft(),  
            pregunta3: state.form.pregunta3, 
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5, 
            pregunta6: state.form.pregunta6,  
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 3
      formPregunta3Changed: (formPregunta3ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: formPregunta3ChangedEvent.text.trimLeft(),
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5, 
            pregunta6: state.form.pregunta6,  
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 4
      formPregunta4Changed: (formPregunta4ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: formPregunta4ChangedEvent.text.trimLeft(), 
            pregunta5: state.form.pregunta5, 
            pregunta6: state.form.pregunta6,  
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 5
      formPregunta5Changed: (formPregunta5ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: state.form.pregunta4, 
            pregunta5: formPregunta5ChangedEvent.text.trimLeft(),
            pregunta6: state.form.pregunta6,  
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 6
      formPregunta6Changed: (formPregunta6ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5,
            pregunta6: formPregunta6ChangedEvent.text.trimLeft(), 
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 7
      formPregunta7Changed: (formPregunta7ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5,
            pregunta6: state.form.pregunta6, 
            pregunta7: formPregunta7ChangedEvent.text.trimLeft(),  
            pregunta8: state.form.pregunta8, 
            resultado: state.form.resultado, 
          ),
        );
      },

      // Actualiza el esatdo del dropdown de la pregunta 8
      formPregunta8Changed: (formPregunta8ChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5,
            pregunta6: state.form.pregunta6, 
            pregunta7: state.form.pregunta7,  
            pregunta8: formPregunta8ChangedEvent.text.trimLeft(), 
            resultado: state.form.resultado, 
          ),
        );
      },

      formResultadoChanged: (formResultadoChangedEvent) {
        state = state.copyWith(
          form: FormModel( 
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5,
            pregunta6: state.form.pregunta6, 
            pregunta7: state.form.pregunta7,  
            pregunta8: state.form.pregunta8,
            resultado: formResultadoChangedEvent.text.trimLeft(),  
          ),
        );
      },

      // Cuando se agrega una nueva tarea
      addTodo: (addFormEvent) {
        final List<FormModel> formList = [...state.formList]; // Crea una copia de la lista de tareas actual
        formList.add(
          FormModel(// Genera un nuevo ID único para la tarea
            pregunta1: state.form.pregunta1,
            pregunta2: state.form.pregunta2,  
            pregunta3: state.form.pregunta3,
            pregunta4: state.form.pregunta4, 
            pregunta5: state.form.pregunta5,
            pregunta6: state.form.pregunta6, 
            pregunta7: state.form.pregunta7,
            pregunta8: state.form.pregunta8,
            resultado: state.form.resultado, 
          ),
        );
        state = state.copyWith(formList: formList); // Actualiza el estado con la nueva lista de tareas
      },
    );
  }
}