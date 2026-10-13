RetailPro — Análisis de datos de ventas con SQL

Descripción del proyecto

RetailPro es un proyecto de análisis de datos del sector retail, desarrollado con SQL y orientado al análisis de ventas de productos tecnológicos.
El proyecto utiliza una base de datos relacional que permite almacenar información de categorías, clientes, productos y ventas. A partir de estos datos, se desarrollan consultas SQL para analizar la facturación, identificar los productos con mejor desempeño y obtener información útil para la toma de decisiones del negocio.

Objetivos del proyecto

Diseñar y crear una base de datos relacional.
Definir tablas y relaciones mediante claves primarias y foráneas.
Insertar y validar datos de ejemplo.
Analizar las ventas mediante consultas SQL.
Identificar productos destacados y clientes recurrentes.
Combinar información de diferentes tablas utilizando JOINs.
Obtener indicadores de negocio a partir de los datos disponibles.

Herramientas y tecnologías

Microsoft SQL Server: motor de base de datos compatible con los scripts del proyecto.
T-SQL: lenguaje utilizado para crear tablas, insertar datos y realizar consultas de análisis.
GitHub: plataforma utilizada para almacenar y versionar los archivos del proyecto.
Para ejecutar los scripts se puede utilizar SQL Server Management Studio (SSMS) u otra herramienta compatible con SQL Server.

Estructura de la base de datos

La base de datos principal se llama Ventas_Tech_DB y contiene las siguientes tablas:
Tabla	Descripción
categorias	Almacena las categorías de los productos tecnológicos.
clientes	Contiene los datos de los clientes, su ciudad y fecha de registro.
productos	Registra los productos, sus precios, categorías, stock y estado.
ventas	Almacena las ventas realizadas, las cantidades, los precios y las fechas.
Las tablas están relacionadas mediante claves primarias y claves foráneas, lo que permite vincular los clientes y productos con sus respectivas ventas, y los productos con sus categorías.

Scripts SQL del proyecto

El proyecto se organiza en tres scripts principales:

1. Creación y carga de la base de datos
Este script crea la base de datos Ventas_Tech_DB, define las tablas, establece las relaciones entre ellas e inserta datos de ejemplo.
También incluye consultas de validación para comprobar el contenido de las tablas.

2. Consultas SQL de negocio
Este script desarrolla consultas para analizar el comportamiento de las ventas.
Incluye:
Resumen mensual de facturación, cantidad de pedidos y ticket promedio.
Ranking de productos según unidades vendidas y facturación.
Identificación de clientes recurrentes.
Comparación de la facturación mensual con el promedio del período.

3. Consultas SQL con JOINs
Este script combina información de distintas tablas para obtener una visión más completa de las operaciones.
Incluye:
Vista general de las ventas con datos de clientes, productos y categorías mediante INNER JOIN.
Identificación de clientes sin ventas mediante LEFT JOIN.
Identificación de productos sin ventas mediante LEFT JOIN.
Consolidación de la facturación por períodos mediante UNION ALL.

Requisitos previos

Para ejecutar el proyecto se necesita:
Microsoft SQL Server instalado o acceso a una instancia de SQL Server.
SQL Server Management Studio (SSMS) u otra herramienta compatible con T-SQL.
Los tres scripts SQL del repositorio.

Cómo ejecutar los scripts SQL

Para ejecutar el proyecto correctamente, se recomienda seguir este orden:
Abrir SQL Server Management Studio o la herramienta SQL utilizada.
Conectarse a una instancia de SQL Server.
Abrir el primer script, correspondiente a la creación y carga de la base de datos.
Ejecutar el script completo para crear Ventas_Tech_DB, generar las tablas e insertar los datos de ejemplo.
Abrir el segundo script, correspondiente a las consultas SQL de negocio, y ejecutarlo.
Abrir el tercer script, correspondiente a las consultas con JOINs, y ejecutarlo.
Revisar los resultados de las consultas para verificar los indicadores y la información obtenida.
Importante: los scripts de consultas utilizan USE Ventas_Tech_DB. Por lo tanto, es necesario ejecutar primero el script de creación y carga de datos. 
Los scripts de consultas también contienen instrucciones CREATE DATABASE consultas_negocio y CREATE DATABASE consultas_joins. Estas crean bases adicionales que no son utilizadas por las consultas posteriores, ya que ambas vuelven a seleccionar Ventas_Tech_DB.

Advertencias antes de ejecutar:
El script de creación elimina las tablas existentes (ventas, productos, clientes y categorias) antes de volver a crearlas. Por este motivo, al ejecutarlo nuevamente se perderán los datos almacenados en esas tablas. Se recomienda utilizar una base de datos de prueba.

Principales resultados del análisis

A partir de los datos de ejemplo incluidos en el proyecto, se obtienen los siguientes resultados:
Producto con mayor facturación: el producto con ID 1, con una facturación total de 3.600,00.
Clientes recurrentes: los cinco clientes registran dos ventas cada uno en los datos de ejemplo.
Mes con mayor facturación: marzo de 2024, con un total facturado de 6.444,00.
Estos resultados corresponden exclusivamente a los datos de ejemplo cargados en la base de datos.

Los indicadores presentados se calculan a partir de los datos de ejemplo incluidos en el proyecto y no representan necesariamente resultados reales de una empresa.

Autor
Mailen Rodriguez

Repositorio de GitHub
RetailPro — Repositorio del proyecto



