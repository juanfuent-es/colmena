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
    { program: @program, number: 2,  title: "Arquitectura de Información" },
    { program: @program, number: 3,  title: "El desarrollador FrontEnd" },
    { program: @program, number: 4,  title: "CSS - Styling" },
    { program: @program, number: 5,  title: "Fundamentos de Programación" },
    { program: @program, number: 6,  title: "Variables, Operadores y Estructuras de Datos" },
    { program: @program, number: 7,  title: "El desarrollador Backend" },
    { program: @program, number: 8,  title: "Programación Orientada a Objetos - Modelado de Datos (Java)" },
    { program: @program, number: 9,  title: "Bases de Datos Relacionales con SQLite (Java + Spring Boot)" },
    { program: @program, number: 10, title: "El desarrollador FullStack" },
    { program: @program, number: 11, title: "Javascript" },
    { program: @program, number: 12, title: "Visualización de Datos (Python)" }
])

@theme = Theme.find_by_number(1)
# content_type
# objective
# exercises
# homework
# comments
# reference_material
# credits_and_sources

Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Qué es IT, generalidades de la programación" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Breviario Técnico: Arquitectura del Stack" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Instalación y Configuración de Ambientes" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Editores de Código e IDEs" })
Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Control de Versiones con Git" })

@theme = Theme.find_by_number(2)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es y para qué sirve?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Wireframes y prototipos" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Flujo de navegación" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Introducción a vistas / Mapas de sitio" })

@theme = Theme.find_by_number(3)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es el frontend?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Estructura básica de un documento HTML" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Etiquetas principales: títulos, párrafos, listas, tablas" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Enlaces e imágenes" })

@theme = Theme.find_by_number(4)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Sintaxis y selectores" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Colores, tipografía y espaciado" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Box model y layout" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Estilos responsive básicos" })

@theme = Theme.find_by_number(5)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Pensamiento computacional" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Algoritmos y lógica computacional" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Diagramas de flujo" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Pseudocódigo" })

@theme = Theme.find_by_number(6)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Variables y Tipos de Datos Primitivos" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Operadores en Java" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Estructuras de Datos Básicas" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Conversión de Tipos y Casting" })

@theme = Theme.find_by_number(7)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un backend?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Estructuras de Control (Condicionales)" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Bucles (Ciclos Definidos e Indefinidos)" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Funciones (Modularidad y Reutilización)" })

@theme = Theme.find_by_number(8)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es un modelo de datos?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Atributos y clases en Java" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Relaciones entre modelos" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Buenas prácticas en modelado" })

@theme = Theme.find_by_number(9)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es una base de datos relacional?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Creación de tablas con SQL" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Integración con Spring Boot" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Consultas básicas: SELECT, INSERT, UPDATE, DELETE" })

@theme = Theme.find_by_number(10)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un programador fullstack?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Patrón MVC: Modelo-Vista-Controlador" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Implementar operaciones CRUD" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Validación de datos" })
Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Enrutamiento y endpoints REST" })

@theme = Theme.find_by_number(11)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Sintaxis y variables" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Interactividad: Eventos y DOM" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Visualización de datos" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Visualización dinámica de datos" })

@theme = Theme.find_by_number(12)
Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un cientifico de datos?" })
Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Introducción a Python y entornos interactivos" })
Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Librerías para visualización: matplotlib y seaborn" })
Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Lectura de datos desde la API" })
Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Análisis visual simple" })