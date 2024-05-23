<p align="center">
  <a href="https://flutter.dev/" target="blank"><img src="https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg" width="200" alt="Flutter Logo"/></a>
</p>

# TesloShop App - CRUD

Aplicación creada con [Flutter Móvil](https://flutter.dev/) y [Dart](https://dart.dev/), la cual te permite accesar a una "tienda virtual", podrás ver los diferentes productos que se tienen, ver las existencias, seleccionar tallas, crear nuevos productos, crear nuevos usuarios, etc. Solo es la parte de ver productos, generarlos y crear nuevos usuarios, el punto de venta está en planeación.

El BackEnd utilizado fue proporcionado por [Fernando Herrera](https://fernando-herrera.com/), proveniente de un curso que él mismo imparte, el cual, fue generado en [Nest](https://nestjs.com/) para trabajarse desde [Docker](https://www.docker.com/).

Para esta App se utilizan dependencias como [dio](https://pub.dev/packages/dio), [formz](https://pub.dev/packages/formz), [flutter_riverpod](https://pub.dev/packages/flutter_riverpod), [flutter_dotenv](https://pub.dev/packages/flutter_dotenv), [shared_preferences](https://pub.dev/packages/shared_preferences), [flutter_staggered_grid_view](https://pub.dev/packages?q=flutter_staggered_grid_view), [image_picker](https://pub.dev/packages/image_picker), [go_router](https://pub.dev/packages/go_router), [google_fonts](https://pub.dev/packages/google_fonts), entre otros.

Algunos de los conceptos utilizados para la generación de ésta App, son:

1. Docker.
2. Docker compose.
3. Imágenes de docker.
4. Conectarse a postgres usando TablePlus
.
5. Probar el backend configurado.
6. Llenar la base de datos.
7. Leer la documentación del backend.
8. Generar JWTs y probarlos.
9. Uso de bearer tokens en los headers de autenticación.
10. Pruebas con Postman.
11. Realizar el POST HTTP.
12. Obtener las credenciales del usuario.
13. Manejo de errores personalizados.
14. Manejo del estado del formulario con Riverpod.
15. Comunicación entre providers.
16. Protección de rutas.
17. Redireccionamiento.
18. Actualizar instancia del GoRouter cuando hay cambios en el estado.
19. Listeners de GoRouter.
20. Change notifier.
21. Preferencias de usuario.
22. Almacenar token de acceso de forma permanente.
23. Masonry ListView.
24. Entidades.
25. Datasources.
26. Repositorios.
27. Providers.
28. StateNotifierProvider.
29. Formularios.
30. Segmentos de botones.
31. Selectores.
32. Posteos.
    - Path.
    - Post
33. Retroalimentación de sucesos.
34. Manejo de errores.
35. Inputs personalizados.
36. Patrón adaptador sobre el paquete de cámara.
37. POST Form Multipart.
38. Mostrar imágenes como archivos.
39. Multiples cargas simultáneas.
40. Postman - Pruebas de API.
41. Actualizar estado del formulario.
42. Validaciones.
43. Y más.

## El backend lo pueden obtener de aquí

[Teslo Backend - Nest RestServer](https://hub.docker.com/repository/docker/klerith/flutter-backend-teslo-shop/general)

## Importante
Recuerden leer y seguir la guía para montar el backend localmente.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
