# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.first_or_create!(email: "admin@example.com", password: "password", password_confirmation: "password")

Topic.all.delete_all
Theme.all.delete_all
Program.all.delete_all

@program = Program.create(name: "IT Starter", description: "En este curso aprenderás el funcionamiento de los sistemas que facilitan el intercambio de información, la gestión de datos y su visualización. A través de un ejemplo práctico de la vida real podrás distinguir entre Frontend, Backend, Análisis de Datos y FullStack.", year: 2025, school: "EBAC")

Theme.create([
    { program: @program, number: 1,  title: "README: Especificaciones y configuración de ambiente" },
    { program: @program, number: 2,  title: "Fundamentos de Programación", description: "Este módulo introduce las bases del pensamiento lógico aplicado a la programación. A través de herramientas como pseudocódigo, diagramas de flujo y algoritmos, se establecen los fundamentos para resolver problemas de forma estructurada, sin necesidad de escribir código." },
    { program: @program, number: 3,  title: "Arquitectura de Información" },
    { program: @program, number: 4,  title: "El desarrollador FrontEnd" },
    { program: @program, number: 5,  title: "CSS - Styling" },
    { program: @program, number: 6,  title: "Variables, Operadores y Estructuras de Datos" },
    { program: @program, number: 7,  title: "El desarrollador Backend" },
    { program: @program, number: 8,  title: "Programación Orientada a Objetos - Modelado de Datos (Java)" },
    { program: @program, number: 9,  title: "Bases de Datos Relacionales con SQLite (Java + Spring Boot)" },
    { program: @program, number: 10, title: "El desarrollador FullStack" },
    { program: @program, number: 11, title: "Javascript" },
    { program: @program, number: 12, title: "Visualización de Datos (Python)" }
])

# content_type
# objective
# exercises
# homework
# comments
# reference_material
# credits_and_sources

@theme = Theme.find_by_number(1)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Qué es IT, generalidades de la programación" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Breviario Técnico: Arquitectura del Stack" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Instalación y Configuración de Ambientes" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Editores de Código e IDEs" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Control de Versiones con Git" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(2)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Pensamiento computacional" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Algoritmos y lógica computacional" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Diagramas de flujo" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Pseudocódigo" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(3)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es y para qué sirve?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Wireframes y prototipos" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Flujo de navegación" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Introducción a vistas / Mapas de sitio" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(4)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es el frontend?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Estructura básica de un documento HTML" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Etiquetas principales: títulos, párrafos, listas, tablas" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Enlaces e imágenes" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(5)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Sintaxis y selectores" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Colores, tipografía y espaciado" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Box model y layout" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Estilos responsive básicos" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(6)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Variables y Tipos de Datos Primitivos" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Operadores en Java" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Estructuras de Datos Básicas" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Conversión de Tipos y Casting" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(7)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un backend?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Estructuras de Control (Condicionales)" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Bucles (Ciclos Definidos e Indefinidos)" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Funciones (Modularidad y Reutilización)" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(8)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es un modelo de datos?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Atributos y clases en Java" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Relaciones entre modelos" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Buenas prácticas en modelado" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(9)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es una base de datos relacional?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Creación de tablas con SQL" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Integración con Spring Boot" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Consultas básicas: SELECT, INSERT, UPDATE, DELETE" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(10)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un programador fullstack?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Patrón MVC: Modelo-Vista-Controlador" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Implementar operaciones CRUD" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Validación de datos" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Enrutamiento y endpoints REST" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(11)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Sintaxis y variables" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Interactividad: Eventos y DOM" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Visualización de datos" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Visualización dinámica de datos" })
puts topic.errors.full_messages unless topic.valid?

@theme = Theme.find_by_number(12)
topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un cientifico de datos?" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Introducción a Python y entornos interactivos" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Librerías para visualización: matplotlib y seaborn" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Lectura de datos desde la API" })
puts topic.errors.full_messages unless topic.valid?
topic = Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Análisis visual simple" })
puts topic.errors.full_messages unless topic.valid?