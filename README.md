
# App Android Guía de Compras

Este proyecto es una aplicación móvil desarrollada en **Android Studio** utilizando **Flutter** y **Dart**, diseñada para ser una guía de compras enfocada en el **Valle de los Chillos**. La app permite a los usuarios seleccionar sectores específicos de esta región y encontrar tiendas y productos basados en categorías, con integración a **Google Maps** para facilitar la localización.

## Características

1. **Interfaz de Inicio**
   - Pantalla principal donde se muestra el logo de la aplicación y un botón para comenzar la experiencia.
   - **Imagen de la interfaz**:
     <img src="pages/p1.jpeg" alt="Logo de la App" width="300"/>

2. **Selección del Sector**
   - Interfaz donde el usuario puede seleccionar el sector del Valle de los Chillos en el que desea realizar la búsqueda de productos.
   - **Imagen de la interfaz**:
     <img src="pages/p2.jpeg" alt="Selección sector" width="300"/>

3. **Listado de Tiendas por Categoría**
   - Muestra las tiendas disponibles en el sector seleccionado, organizadas por categorías para facilitar la búsqueda.
   - **Imagen de la interfaz**:
     <img src="pages/p3.jpeg" alt="Listado Tiendas" width="300"/>

4. **Integración con Google Maps**
   - Al seleccionar una tienda, se abre Google Maps con una ventana personalizada donde se muestran las categorías y productos disponibles en esa tienda.
   - **Imagen de la interfaz**:
     <img src="pages/p4.jpeg" alt="Ventana Personalizada" width="300"/>

## Tecnologías Utilizadas

- **Flutter**: Framework para el desarrollo de la interfaz de usuario.
- **Dart**: Lenguaje de programación utilizado para la lógica de la aplicación.
- **Google Maps API**: Para la integración y visualización de tiendas y productos en el mapa.
- **Android Studio**: Entorno de desarrollo.

## Cómo Ejecutar el Proyecto

1. Clona este repositorio:
   ```bash
   git clone https://github.com/mspadron28/AppAndroid_GuiaCompras.git
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Conéctate a un dispositivo físico o emulador Android y ejecuta la aplicación:
   ```bash
   flutter run
   ```


