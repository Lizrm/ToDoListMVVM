# ToDoListMVVM

#Project Description:

        Presenta una lista de tareas, el cual permite agregar tareas, editar, borrar y marcar como completadas o no.

        
#Architecture Overview:

                Task: Tipo de tarea, structura de datos y sus caracteristicas
                TaskViewModel: Encargada del manejo de los datos, agregar, eliminar, actualizar y manejo de la persistencia de                     los datos
                TaskDetailView: encargada de mostrar y comunicarse con TaskViewModel para editar la tarea en caso de que el                         usuario lo desee (Es llamada desde el TaskListView)
                TaskListView: Vista principal, se comunica con TaskViewModel para obtener los detalles lista y estado de las                       tareas asi como para agregar eliminar y actualizar el estado de las tareas.
                  Tambien se comunica con TaskDetailView la llama para que se encargue de actualizar la "descipcion" titulo de                     la tarea

#Usage Instructions:

                Abrir una ventana de xcode, Version 16.1, importar el proyecto utilizar un emulador de iphone preferiblemente y                 darle Run. 

#Features Implemented:

                Se pueden agregar tareas desde la vista principal.
                Se pueden borrar tareas utilizando el boton de Edit  y la funcionalidad de borrado integrada de iOS
                Si se da click sobre una tarea o en la flecha > se podra editar la misma.
                Cada tarea tiene in toogle que permite saber si la tarea a sido completada o no.
               * En caso de editar una tarea la misma mantendra el estado del toogle (completada o no) en el que se encontraba                    antes de ser editada

#Screenshots:

                Se agrega una carpeta con capturas de pantalla en el proyecto llamada Screenshots.

#Future Enhancements:

                Se Pueden mejorar las vistas
                (Mis respetos para los de front_end como cuesta acomodar un solo boton)
                Se puede agregar un box para poder organizar las tareas por tipos
                Tambien poder ponerles colores seria otra opcion
                Autenticacion de usuario ojala por huella digital para mantener la privacidad
                
