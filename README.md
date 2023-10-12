# TodoApp

Proyecto que da solución a la prueba técnica para la empresa Vinnove

## Para empezar

Para compilar y correr este projecto:
  1. Obtener e instalar Flutter si aún no lo tienes
  2. Clonar el repositorio
  3. Ejecutar el comando `flutter pub get`
  4. Y para correr el proyecto ejecutar el comando `flutter run --flavor dev -t lib/main_dev.dart`

## Acerca de la aplicación

Pantalla inicial del app, en donde se pueden encontrar todas las tareas dispuestas desde Firebase, como estado inicial se muestran todas las tareas

<img src= "https://i.postimg.cc/0yBV8VFj/Screenshot-1697125676.png" height ="500">

Al darle al filtro superior, podemos ver las tareas completas 

<img src= "https://i.postimg.cc/d1H1XTDb/Screenshot-1697125680.png" height ="500">

Además de seleccionar tambien las tareas incompletas

<img src= "https://i.postimg.cc/4dNyB14v/Screenshot-1697125678.png" height ="500">

El estado de las tareas se actualiza al presionar el icono derecho que tienen cada una de las tareas donde el ícono verde es "Tarea Completa" y el amarillo "Tarea Incompleta", al presionarlos su estado se actualiza directamente en la base de datos donde se guarda la trazabilidad de la fecha en la cual fue actualizada

<img src= "https://i.postimg.cc/sXQXkgS1/imagen-2023-10-12-105712135.png" width ="200">

## Firebase

El proyecto cuenta con el servicio de Firestore Database, donde se almacenan las tareas dispuestas para este proyecto, dichas tareas tienen la siguiente estructura

<img src= "https://i.postimg.cc/QtkPxpcz/imagen-2023-10-12-110108674.png" width ="200">

Donde:
 - `id` representa el id unico de la tarea, este ID es de tipo String
 - `name` representa el nombre de la tarea
 - `state` representa el estado de la tarea, completa `true`, incompleta `false`
 - `updateAt` representa la fecha de actualización de la tarea
 - `updateBy` representa el usuario que actualizo la tarea, por el momento se representa en blanco ya que no hay modulo de usuario
