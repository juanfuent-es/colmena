# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.first_or_create!(email: "admin@example.com", password: "password", password_confirmation: "password")

Topic.all.delete_all
Theme.all.delete_all
Program.all.delete_all

@program = Program.create(name: "IT Starter", description: "En este curso aprenderás el funcionamiento de los sistemas que facilitan el intercambio de información, la gestión de datos y su visualización. A través de un ejemplo práctico de la vida real podrás distinguir entre Frontend, Backend, Análisis de Datos y FullStack.", year: 2025, school: "EBAC", url: "")
@theme = Theme.create({ program: @program, title: "README: Especificaciones y configuración de ambiente", number: 1, description: "En este módulo se presentan las especificaciones del curso y se configura el ambiente de trabajo. Se espera que los estudiantes instalen y configuren las herramientas necesarias para el desarrollo de software.", activity: "" })
Topic.create({ theme: @theme, number: "1", title: "Qué es IT, generalidades de la programación", estimated_time: "20", content_type: "video_studio", objective: "<p>Comprender el papel de las tecnologías de información en el mundo actual y su relación con el desarrollo de software, así como adquirir una visión general de qué es programar y para qué sirve.</p>", presentation: '<p>Vivimos en una era digital. Desde los teléfonos hasta los semáforos, todo está gobernado por sistemas informáticos. En este tema exploraremos qué son las IT, para qué sirven, y cómo la programación actúa como el lenguaje que permite construir soluciones dentro de este ecosistema.</p>', comments: '<p><strong>¿Qué son las Tecnologías de Información (IT)?</strong><br>Conjunto de herramientas, sistemas y recursos tecnológicos utilizados para crear, almacenar, procesar y compartir información.</p><p>&nbsp;</p><p><strong>Ramas principales de IT</strong><br>Infraestructura, desarrollo de software, análisis de datos, ciberseguridad, redes, etc.</p><p>&nbsp;</p><p><strong>Aplicaciones de IT en la vida diaria</strong><br>Uso en salud, educación, comercio, entretenimiento, transporte, etc.</p><p>&nbsp;</p><p><strong>¿Qué es la programación?</strong><br>El proceso de escribir instrucciones que una computadora puede ejecutar.</p><p>&nbsp;</p><p><strong>Relación entre programación e IT</strong><br>La programación es el motor que impulsa las soluciones tecnológicas.</p><p>&nbsp;</p><p><strong>Lenguajes y entornos comunes</strong><br>Breve vistazo a lenguajes como Java, Python, JavaScript. Mención del backend/frontend.</p>', exercises: '<p>Reflexionar sobre el impacto de las tecnologías de la información en la vida diaria y reconocer situaciones donde la programación ha sido clave en experiencias personales o colectivas.</p>', homework: "<p><strong>Tiempo estimado:</strong> 45–60 minutos</p><p>&nbsp;</p><p><strong>Nombre:</strong> “Mi entorno y la tecnología”</p><p>&nbsp;</p><p><strong>Descripción:</strong><br>Los estudiantes deberán realizar una bitácora breve (puede ser escrita o visual) identificando:</p><p>Tres objetos o servicios cotidianos que utilicen IT.</p><p>Describir brevemente su funcionamiento y cómo impactan su vida diaria.</p><p>Investigar si alguno de estos utiliza programación (por ejemplo: apps, semáforos, asistentes virtuales).</p><p>Reflexionar con un párrafo final: ¿cómo creen que el aprender programación les permitiría mejorar o proponer soluciones a estos sistemas?</p><p>&nbsp;</p><p><strong>Formato:</strong> texto breve (1 cuartilla o presentación de 3 diapositivas)</p>", reference_material: "", credits_and_sources: "" })
Topic.create({ theme: @theme, number: "2", title: "Breviario Técnico: Arquitectura del Stack", estimated_time: "20", content_type: "pdf_ppt", objective: "<p>Conocer y comprender los términos técnicos esenciales que se usarán durante el curso para facilitar la lectura de documentación, comunicación y aprendizaje.</p>", presentation: '<p>Todo sistema digital está compuesto por múltiples capas, como una cebolla o un edificio. En este tema conocerás los términos técnicos más importantes y entenderás cómo se organiza un proyecto tecnológico desde el cliente hasta el servidor, y más allá.</p>', comments: '<p><strong>¿Qué es un "Stack Tecnológico"?</strong><br>Conjunto de tecnologías (lenguajes, frameworks, herramientas) usadas para construir un sistema digital.</p><p>&nbsp;</p><p><strong>Frontend, Backend y Base de Datos</strong><br>Analogía con un restaurante: el mesero (frontend), la cocina (backend), y la despensa (base de datos).</p><p>&nbsp;</p><p><strong>Glosario de términos esenciales</strong><br>Revisión de conceptos clave como: servidor, cliente, HTTP, API, DOM, framework, librería, IDE, compilador, etc.</p><p>&nbsp;</p><p><strong>Full Stack Developer: ¿Qué significa?</strong><br>Profesional que conoce las herramientas y tecnologías de todas las capas.</p><p>&nbsp;</p><p><strong>Navegador y servidor: ¿cómo se comunican?</strong><br>Flujo básico de una petición desde que escribimos una URL hasta que vemos la respuesta.</p>', exercises: "<p>Lectura/consulta de diccionarios, tech como: The Jargon File (a.k.a. Hacker's Dictionary)</p>", homework: "", reference_material: "", credits_and_sources: "" })
Topic.create({ theme: @theme, number: "3", title: "Instalación y Configuración de Ambientes", estimated_time: "20", content_type: "screencast", objective: "<p>Preparar un entorno funcional para el desarrollo web y backend, instalando herramientas y configuraciones necesarias para programar en Java y Python.</p>", presentation: '<p>Antes de escribir una sola línea de código, necesitas preparar tu espacio de trabajo: instalar programas, configurar terminales y asegurarte de que todo esté listo para comenzar a construir. Este paso es como preparar tu cocina antes de empezar a cocinar.</p>', comments: '<p><strong>¿Qué es un entorno de desarrollo?</strong><br>El conjunto de herramientas que usas para programar: desde el editor de texto hasta el navegador o servidor local.</p><p>&nbsp;</p><p><strong>Terminal y línea de comandos</strong><br>Cómo navegar carpetas, ejecutar comandos básicos, instalar software y comprender lo que ves en la consola.</p><p>&nbsp;</p><p><strong>Instalación de herramientas básicas</strong></p><p>Navegador (recomendado: Firefox Developer o Chrome)</p><p>Terminal (integrada o herramientas como iTerm2 o Windows Terminal)</p><p>Node.js y NPM (como base para muchas herramientas modernas)</p><p>Git (para control de versiones)</p><p>&nbsp;</p><p><strong>Estructura de carpetas para proyectos</strong><br>Cómo organizar tus archivos desde el inicio: carpetas para código, recursos, documentación y más.</p>', exercises: '<p>Realiza la instalación de Java, Python y Git en tu equipo. Sigue el tutorial paso a paso según tu SO</p>', homework: "<p>El estudiante deberá seguir una guía paso a paso para instalar: Git, JDK 17 (Java), y Python 3. Verificará su correcta instalación usando la terminal y resolverá posibles errores comunes de configuración.</p><p>&nbsp;</p><p><strong>Descripción:</strong></p><p>Instala Node.js y Git en tu equipo.</p><p>Crea una carpeta llamada mi-primer-proyecto/ en tu escritorio.</p><p>Dentro de ella crea las siguientes subcarpetas: src/, assets/, docs/, tests/.</p><p>Inicializa un repositorio de Git dentro de esta carpeta.</p><p>Crea un archivo README.md explicando qué herramientas instalaste y cómo organizaste tus carpetas.</p><p>Haz tu primer commit con el mensaje: Primer setup del entorno.</p><p>&nbsp;</p><p><strong>Tiempo estimado:</strong> 45–60 minutos</p>", reference_material: "<p>Manuales, tutoriales de instalación y links a documentación oficial.</p>", credits_and_sources: '<p><a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git">https://git-scm.com/book/en/v2/Getting-Started-Installing-Git&nbsp;</a></p><p>https://www.python.org/downloads/source/</p><p>https://jdk.java.net/24/</p>' })
Topic.create({ theme: @theme, number: "4", title: "Editores de Código e IDEs", estimated_time: "20", content_type: "screencast", objective: "<p>Identificar, instalar y utilizar correctamente herramientas para escribir y gestionar código de forma eficiente y profesional.</p>", presentation: '<p>Existen múltiples editores e IDEs; algunos son ligeros y otros más complejos, pero todos ayudan a mejorar la productividad del desarrollador.</p>', comments: '<p><strong>¿Qué es un editor de código?</strong><br>Aplicaciones que permiten escribir, editar y gestionar archivos de programación, como Visual Studio Code, Sublime Text, o Atom.</p><p>&nbsp;</p><p><strong>¿Qué es un IDE (Entorno de Desarrollo Integrado)?</strong><br>Herramientas más completas que integran compiladores, debuggers, terminales y manejo de proyectos. Ejemplos:&nbsp;</p><p>IntelliJ IDEA, Eclipse, NetBeans.</p><p>&nbsp;</p><p><strong>Visual Studio Code (VS Code)</strong></p><p>Instalación</p><p>Extensiones útiles (Prettier, ESLint, GitLens)</p><p>Atajos de teclado y personalización del entorno</p><p>&nbsp;</p><p><strong>Diferencias clave entre editores y IDEs</strong><br>Cuándo conviene usar uno u otro: proyectos simples vs complejos, velocidad vs funcionalidades, curva de aprendizaje, etc.</p>', exercises: '<p>Instalación de VisualStudio Code</p>', homework: '<p>Elegir e instalar un editor de código (Visual Studio Code recomendado). Configurar extensiones para HTML, Java y Python. Crear una carpeta del proyecto, agregar un archivo .html, .py y .java, y probar que se puedan abrir correctamente. Adjuntar capturas de pantalla del entorno funcionando.</p><p><br><strong>Descripción paso a paso:</strong></p><p>Descarga e instala Visual Studio Code desde <a href="https://code.visualstudio.com">code.visualstudio.com</a>.</p><p>Abre la carpeta de proyecto mi-primer-proyecto/ creada en la tarea anterior.</p><p>Instala al menos 3 extensiones útiles (Prettier, GitLens, Live Server).</p><p>Personaliza el tema de colores de tu editor.</p><p>Crea un archivo index.html dentro de la carpeta src/ y escribe el texto “¡Hola, mundo!”.</p><p>Usa Live Server para abrirlo en tu navegador.</p><p>Toma una captura de pantalla de tu configuración y agrégala al README.md del proyecto.</p>', reference_material: "", credits_and_sources: "<p>https://code.visualstudio.com/</p><p>https://www.jetbrains.com/idea/</p>" })
Topic.create({ theme: @theme, number: "5", title: "Control de Versiones con Git", estimated_time: "20", content_type: "screencast", objective: "<p>Comprender los fundamentos del control de versiones con Git y utilizar comandos básicos para gestionar versiones de proyectos en forma local y remota (GitHub).</p>", presentation: '<p>Git es como una "máquina del tiempo" para tu código. Permite guardar el historial de tus proyectos, volver a versiones anteriores si algo falla, y colaborar con otras personas de forma segura y organizada. Aprenderlo desde el principio te ahorrará muchos dolores de cabeza más adelante.</p>', comments: '<p><strong>¿Qué es Git y para qué sirve?</strong><br>Sistema de control de versiones distribuido que permite registrar los cambios hechos en archivos y proyectos, útil para proyectos personales y en equipo.</p><p>&nbsp;</p><p><strong>Instalación y configuración inicial</strong></p><p>Instalar Git desde git-scm.com</p><p>Configurar nombre de usuario y correo electrónico (git config --global)</p><p>Comandos básicos para comenzar</p><p>&nbsp;</p><p><strong>Inicialización de repositorios y flujo básico</strong></p><p>git init, git status, git add, git commit</p><p>Crear tu primer repositorio local y guardar cambios</p><p>Entender la diferencia entre <i>staging</i> y <i>commit</i></p><p>&nbsp;</p><p><strong>Explorando el historial y buenas prácticas</strong></p><p>git log, git diff, git checkout</p><p>Cómo escribir buenos mensajes de commit</p><p>Organización de carpetas y manejo de archivos ignorados (.gitignore)</p>', exercises: '<ul><li>Creación de cuenta en github.</li><li>Instalación de git.</li><li>Configuración del entorno en el editor de código.</li></ul>', homework: '<p><strong>Tiempo estimado:</strong> 50–60 minutos</p><p><strong>Nombre:</strong> “Bitácora de proyecto”</p><p><br><strong>Descripción paso a paso:</strong></p><p>Instala Git en tu computadora desde <a href="https://git-scm.com/">https://git-scm.com/</a>.</p><p>Abre tu terminal y configura tu nombre y correo con git config --global.</p><p>Dentro de tu carpeta mi-primer-proyecto/, ejecuta git init para inicializar el repositorio.</p><p>Crea un archivo llamado README.md y escribe una breve descripción del proyecto.</p><p>Usa git add . y git commit -m "Primer commit" para registrar tus archivos.</p><p>Realiza dos cambios más (por ejemplo, actualiza el texto en index.html) y haz dos commits adicionales.</p><p>Usa git log para revisar el historial de cambios y escribe en tu cuaderno qué entendiste de cada uno.</p><p>(Opcional) Crea una cuenta en GitHub y sube tu repositorio con git remote add origin y git push.</p><p>&nbsp;</p><p>&nbsp;</p>', reference_material: "", credits_and_sources: "<p>https://git-scm.com/book/en/v2/Getting-Started-Installing-Git</p><p>https://github.com/signup</p>" })
@theme = Theme.create({ program: @program, title: "Fundamentos de Programación", number: 2, description: "Este módulo introduce las bases del pensamiento lógico aplicado a la programación. A través de herramientas como pseudocódigo, diagramas de flujo y algoritmos, se establecen los fundamentos para resolver problemas de forma estructurada, sin necesidad de escribir código.", activity: "" })
Topic.create({ theme: @theme, number: "3", title: "Diagramas de flujo", estimated_time: "20", content_type: "video_screencast", objective: "<p>Representar visualmente procesos lógicos y algoritmos mediante símbolos estándar de flujo de información y control.</p>", presentation: '<p>Los diagramas de flujo son herramientas gráficas utilizadas para representar visualmente los pasos que sigue un proceso o algoritmo. Son útiles para diseñar, analizar y comunicar soluciones antes de escribir código. En este tema aprenderás los principales símbolos, cómo construir diagramas correctamente y cómo aplicarlos a problemas cotidianos.</p>', comments: '<p><strong>¿Qué es un diagrama de flujo?</strong><br>Representación visual de procesos o algoritmos mediante símbolos conectados por flechas, que permiten comprender la lógica de un sistema paso a paso.</p><p>&nbsp;</p><p><strong>Símbolos comunes</strong></p><p><strong>Inicio / Fin</strong>: óvalos que marcan el punto de inicio o final del proceso.</p><p>&nbsp;</p><p><strong>Proceso</strong>: rectángulos que representan operaciones o instrucciones.</p><p>&nbsp;</p><p><strong>Decisión</strong>: rombos que plantean preguntas con respuestas binarias (sí/no).</p><p>&nbsp;</p><p><strong>Flechas</strong>: indican la dirección del flujo.</p><p>&nbsp;</p><p><strong>Entrada / Salida</strong>: paralelogramos que representan datos que se introducen o se muestran.</p><p>&nbsp;</p><p><strong>Reglas de construcción</strong></p><p>Flujo claro de arriba hacia abajo o de izquierda a derecha.</p><p>Un único punto de entrada y de salida.</p><p>Simbología estandarizada.</p><p>Claridad visual y lógica secuencial.</p><p>&nbsp;</p><p><strong>Aplicación a problemas cotidianos</strong><br>Uso de diagramas para representar tareas simples, como preparar café, organizar actividades del día o activar recordatorios, ligándolo al proyecto general de gestión de tareas personales.</p>', exercises: '<p>Construcción de un diagrama de flujo que represente el proceso lógico de una actividad dentro del proyecto de gestión de tareas personales (ej. tomar agua o comer).</p>', homework: "<p><strong>Duración estimada</strong>: 45-60 minutos.</p><p>&nbsp;</p><p><strong>Nombre</strong>: Diagrama de flujo de rutina personalizada</p><p>&nbsp;</p><p><strong>Paso a paso:</strong></p><p>Elige una rutina simple del día basada en el proyecto (ej. “prepararse para dormir”, “comer saludable”, “tomar agua regularmente”).</p><p>Identifica los pasos de dicha rutina.</p><p>Redáctalos como acciones lógicas (sin escribir código).</p><p>Define las decisiones que se deben tomar en el proceso (ej. ¿Tengo sed? ¿Ya comí?).</p><p>Dibuja el diagrama de flujo con los símbolos correctos.</p><p>Revisa que el flujo sea claro y tenga inicio y fin.</p><p>Comparte una imagen del diagrama como entrega.</p><p>&nbsp;</p><p><strong>Material necesario</strong>:</p><p>Hoja blanca y lápiz</p>", reference_material: "", credits_and_sources: "" })
Topic.create({ theme: @theme, number: "1", title: "Pensamiento computacional", estimated_time: "20", content_type: "video_studio", objective: "<p>Desarrollar habilidades de descomposición, reconocimiento de patrones, abstracción y diseño de algoritmos para resolver problemas cotidianos de manera estructurada.</p>", presentation: '<p>El pensamiento computacional es una habilidad esencial que nos permite entender problemas complejos, dividirlos en partes manejables, reconocer patrones, establecer reglas y crear soluciones que pueden automatizarse con un algoritmo. No se trata de programar directamente, sino de pensar como un programador para resolver cualquier tipo de problema.</p>', comments: '<p><strong>¿Qué es el pensamiento computacional?</strong><br>Es un proceso mental que implica descomponer problemas, identificar patrones, abstraer lo importante y diseñar algoritmos para solucionarlos. Es fundamental para cualquier persona que quiera aprender a programar.</p><p>&nbsp;</p><p><strong>Descomposición de problemas</strong><br>Técnica que consiste en dividir un problema complejo en partes más pequeñas y manejables. Esto permite enfocarse en resolver cada componente de manera más eficiente.</p><p>&nbsp;</p><p><strong>Reconocimiento de patrones</strong><br>Buscar similitudes o regularidades entre problemas. Identificar patrones nos permite reutilizar soluciones anteriores en nuevas situaciones.</p><p>&nbsp;</p><p><strong>Abstracción</strong><br>Consiste en eliminar los detalles innecesarios y centrarse en lo esencial del problema. Ayuda a construir modelos simples que pueden aplicarse en múltiples escenarios.</p><p>&nbsp;</p><p><strong>Diseño de algoritmos</strong><br>Es el paso final donde se define una serie de pasos lógicos y secuenciales para resolver el problema. Un buen algoritmo puede luego transformarse fácilmente en código.</p>', exercises: '<p>Aplicar los principios del pensamiento computacional para diseñar una solución paso a paso (algoritmo) para una tarea cotidiana relacionada con el brief principal: gestión de tareas personales como comer, tomar agua o tomar café.</p>', homework: "<p><strong>Tiempo estimado:</strong> 50–60 minutos</p><p>&nbsp;</p><p><strong>Título:</strong> De lo cotidiano al algoritmo</p><p><br><strong>Descripción:</strong> Los alumnos deberán elegir una tarea personal habitual (por ejemplo, recordar beber agua cada 2 horas) y aplicar los elementos del pensamiento computacional para descomponer el problema y diseñar una solución que pueda implementarse más adelante como una función o recordatorio.</p><p>&nbsp;</p><p><strong>Pasos para realizar la tarea:</strong></p><p>Elegir una actividad del brief principal: beber agua, tomar café o comer.</p><p>Aplicar descomposición: dividir la actividad en pasos (ej. definir hora, preparar bebida, consumir, registrar).</p><p>Identificar patrones: ¿cada cuánto se repite? ¿tiene condiciones como horario, lugar, estado físico?</p><p>Aplicar abstracción: eliminar detalles que no aporten al diseño lógico (ej. tipo de vaso, lugar exacto).</p><p>Diseñar un algoritmo: escribir los pasos necesarios de forma ordenada y clara.</p><p>Representar el algoritmo en lenguaje natural o pseudocódigo.</p><p>Redactar una reflexión corta sobre cómo usar este algoritmo en una app de recordatorios.</p><p>Entregar el documento en Google Docs o un .txt, incluyendo el título de la tarea, pasos, pseudocódigo y reflexión.</p>", reference_material: "", credits_and_sources: "" })
Topic.create({ theme: @theme, number: "2", title: "Algoritmos y lógica computacional", estimated_time: "20", content_type: "video_studio", objective: "<p>Comprender cómo diseñar soluciones lógicas a problemas mediante algoritmos claros, precisos y eficientes.</p>", presentation: '<p>Una vez que entendemos cómo descomponer problemas (tema anterior), es momento de aprender a traducir esa descomposición en soluciones concretas. Los algoritmos son instrucciones precisas para ejecutar tareas, mientras que la lógica computacional nos ayuda a tomar decisiones y controlar el flujo de esas instrucciones.</p>', comments: '<p><strong>¿Qué es un algoritmo?</strong><br>Conjunto ordenado y finito de pasos que permiten resolver un problema o realizar una tarea específica.</p><p>&nbsp;</p><p><strong>Estructura básica de un algoritmo</strong><br>Todo algoritmo debe tener: entrada (datos iniciales), proceso (transformación) y salida (resultado).<br>Ejemplo: entrada = hora actual, proceso = comparar con hora de recordatorio, salida = enviar notificación.</p><p>&nbsp;</p><p><strong>Lógica secuencial</strong><br>Ejecutar pasos uno tras otro, en orden. Fundamental en tareas lineales, como preparar café: hervir agua → servir café → beber.</p><p>&nbsp;</p><p><strong>Condicionales (if/else)</strong><br>Permiten tomar decisiones. Ejemplo: “Si ya pasaron 2 horas desde el último vaso de agua, entonces notificar”.</p><p>&nbsp;</p><p><strong>Bucles (while, for)</strong><br>Repetir acciones bajo ciertas condiciones. Útiles para automatizar tareas como recordatorios cada cierto tiempo.</p>', exercises: '<p>Diseñar un algoritmo aplicando lógica secuencial, condicional y repetitiva para una tarea personal basada en el brief del proyecto principal: recordatorios para actividades cotidianas como comer, tomar agua o tomar café.</p>', homework: '<p>T<strong>ítulo:</strong> Algoritmo con lógica: una rutina automatizada<br>&nbsp;</p><p><strong>Descripción:</strong> El estudiante elegirá una acción personal recurrente (por ejemplo, "tomar agua") y deberá crear un algoritmo detallado que incluya una lógica clara: pasos secuenciales, una condición y un ciclo de repetición.</p><p>&nbsp;</p><p><strong>Pasos para realizar la tarea:</strong></p><p>Escoger una rutina del día basada en el brief del proyecto (ej. comer cada 5 horas).</p><p>Redactar la secuencia básica de pasos necesarios para llevarla a cabo.</p><p>Incorporar al menos <strong>una condición</strong> (por ejemplo, "si no has comido en 5 horas").</p><p>Incluir un <strong>bucle</strong> para repetir la acción dentro de un rango horario (por ejemplo, de 8 a 20 hrs).</p><p>Representar el algoritmo en forma de lista ordenada o tabla.</p><p>Especificar entradas, procesos y salidas.</p><p>Agregar comentarios explicando la lógica detrás de cada decisión.</p><p>*Entregar la tarea en documento digital</p>', reference_material: "", credits_and_sources: "" })
Topic.create({ theme: @theme, number: "4", title: "Pseudocódigo", estimated_time: "20", content_type: "screencast", objective: "<p>Desarrollar la capacidad de escribir instrucciones paso a paso en lenguaje natural estructurado, mediante pseudocódigo, como preparación para la escritura de código en un lenguaje de programación real.</p><p>(Enfocado en la lógica antes que en la sintaxis)</p>", presentation: '<p>El pseudocódigo es una forma intermedia entre el lenguaje humano y el lenguaje de programación. Se utiliza para planificar soluciones lógicas sin preocuparse por la sintaxis específica de un lenguaje. En este tema aprenderás a estructurar procesos usando instrucciones claras, simples y organizadas, como base previa al código.</p>', comments: '<p><strong>¿Qué es el pseudocódigo?</strong><br>Es una herramienta para representar algoritmos de manera textual, usando lenguaje cotidiano estructurado y términos similares a los de programación.</p><p>&nbsp;</p><p><strong>Características del pseudocódigo</strong></p><p>Independiente del lenguaje de programación.</p><p>Fácil de escribir y entender.</p><p>Utiliza palabras clave como INICIO, FIN, SI, ENTONCES, MIENTRAS, ESCRIBIR, etc.</p><p>Ideal para comunicar lógica sin errores de sintaxis.</p><p>&nbsp;</p><p><strong>Estructura básica</strong></p><p><strong>Inicio y fin del algoritmo.</strong></p><p><strong>Entrada de datos.</strong></p><p><strong>Procesos o cálculos.</strong></p><p><strong>Condiciones y bucles.</strong></p><p><strong>Salida o impresión de resultados.</strong></p><p>&nbsp;</p><p><strong>Buenas prácticas</strong></p><p>Escribir instrucciones claras y concisas.</p><p>Usar sangrías para mostrar jerarquías o bloques.</p><p>Nombrar variables de forma lógica y legible.</p><p>Revisar el orden de ejecución de cada paso.</p>', exercises: '<p>Redactar en pseudocódigo la lógica de una rutina de gestión de tareas personales (ej. "Recordar tomar agua cada hora"), respetando estructura y claridad lógica.</p>', homework: "<p><strong>Nombre</strong>: Pseudocódigo de rutina diaria</p><p><strong>Paso a paso:</strong></p><p>Escoge una rutina simple y cotidiana del proyecto de gestión de tareas personales (ej. “tomar café en la mañana” o “almorzar a una hora fija”).</p><p>Lista los pasos necesarios para ejecutar esa tarea en orden lógico.</p><p>Agrega decisiones simples si aplica (¿ya comí?, ¿pasó 1 hora?, etc.).</p><p>Escribe el pseudocódigo con palabras clave como SI, ENTONCES, MIENTRAS, etc.</p><p>Asegúrate de comenzar con INICIO y finalizar con FIN.</p><p>Revisa la lógica general del flujo.</p><p>Comparte tu pseudocódigo como entrega.</p><p><strong>Duración estimada</strong>: 45 minutos.</p><p><strong>Material necesario</strong>:</p><p>Hoja, procesador de texto o herramienta online simple como repl.it, Notepad, etc.</p>", reference_material: "", credits_and_sources: "" })
@theme = Theme.create({ program: @program, title: "Arquitectura de Información", number: 3, description: "En este módulo se presentan los conceptos básicos de la arquitectura de información, incluyendo wireframes, prototipos y mapas de sitio. Se espera que los estudiantes comprendan la importancia de la organización y presentación de la información en aplicaciones web.", activity: "" })
Topic.create({ theme: @theme, number: "1", title: "¿Qué es y para qué sirve?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Wireframes y prototipos", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Flujo de navegación", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Introducción a vistas / Mapas de sitio", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "El desarrollador FrontEnd: HTML - Estructura", number: 4, description: "Este módulo introduce los conceptos básicos de HTML, incluyendo la estructura de un documento HTML, etiquetas principales y atributos. Se espera que los estudiantes comprendan cómo se organiza y presenta la información en una página web.", activity: "" })
Topic.create({ theme: @theme, number: "1", title: "¿Qué es el frontend?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Estructura básica de un documento HTML", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Etiquetas principales: títulos, párrafos, listas, tablas", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Enlaces e imágenes", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "CSS - Styling", number: 5, description: "En este módulo se presentan los conceptos básicos de CSS, incluyendo selectores, propiedades y valores. Se espera que los estudiantes comprendan cómo se aplica el estilo a una página web y cómo se organiza la información visualmente.", activity: "" })
Topic.create({ theme: @theme, number: "1", title: "Sintaxis y selectores", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Colores, tipografía y espaciado", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Box model y layout", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Estilos responsive básicos", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "Variables, Operadores y Estructuras de Datos", number: 6 })
Topic.create({ theme: @theme, number: "1", title: "Variables y Tipos de Datos Primitivos", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Operadores en Java", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Estructuras de Datos Básicas", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Conversión de Tipos y Casting", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "El desarrollador Backend", number: 7 })
Topic.create({ theme: @theme, number: "1", title: "¿Qué hace un backend?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Estructuras de Control (Condicionales)", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Bucles (Ciclos Definidos e Indefinidos)", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Funciones (Modularidad y Reutilización)", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "Programación Orientada a Objetos - Modelado de Datos (Java)", number: 8 })
Topic.create({ theme: @theme, number: "1", title: "¿Qué es un modelo de datos?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Atributos y clases en Java", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Relaciones entre modelos", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Buenas prácticas en modelado", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "Bases de Datos Relacionales con SQLite (Java + Spring Boot)", number: 9 })
Topic.create({ theme: @theme, number: "1", title: "¿Qué es una base de datos relacional?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Creación de tablas con SQL", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Integración con Spring Boot", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Consultas básicas: SELECT, INSERT, UPDATE, DELETE", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "El desarrollador FullStack", number: 10 })
Topic.create({ theme: @theme, number: "1", title: "¿Qué hace un programador fullstack?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Patrón MVC: Modelo-Vista-Controlador", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Implementar operaciones CRUD", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Validación de datos", estimated_time: "20" })
Topic.create({ theme: @theme, number: "5", title: "Enrutamiento y endpoints REST", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "Javascript", number: 11 })
Topic.create({ theme: @theme, number: "1", title: "Sintaxis y variables", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Interactividad: Eventos y DOM", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Visualización de datos", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Visualización dinámica de datos", estimated_time: "20" })
@theme = Theme.create({ program: @program, title: "Visualización de Datos (Python)", number: 12 })
Topic.create({ theme: @theme, number: "1", title: "¿Qué hace un cientifico de datos?", estimated_time: "20" })
Topic.create({ theme: @theme, number: "2", title: "Introducción a Python y entornos interactivos", estimated_time: "20" })
Topic.create({ theme: @theme, number: "3", title: "Librerías para visualización: matplotlib y seaborn", estimated_time: "20" })
Topic.create({ theme: @theme, number: "4", title: "Lectura de datos desde la API", estimated_time: "20" })
Topic.create({ theme: @theme, number: "5", title: "Análisis visual simple", estimated_time: "20" })


# @program = Program.create(name: "IT Starter", description: "En este curso aprenderás el funcionamiento de los sistemas que facilitan el intercambio de información, la gestión de datos y su visualización. A través de un ejemplo práctico de la vida real podrás distinguir entre Frontend, Backend, Análisis de Datos y FullStack.", year: 2025, school: "EBAC")
# 
# Theme.create([
    # { program: @program, number: 1,  title: "README: Especificaciones y configuración de ambiente", description: "En este módulo se presentan las especificaciones del curso y se configura el ambiente de trabajo. Se espera que los estudiantes instalen y configuren las herramientas necesarias para el desarrollo de software." },
    # { program: @program, number: 2,  title: "Fundamentos de Programación", description: "Este módulo introduce las bases del pensamiento lógico aplicado a la programación. A través de herramientas como pseudocódigo, diagramas de flujo y algoritmos, se establecen los fundamentos para resolver problemas de forma estructurada, sin necesidad de escribir código." },
    # { program: @program, number: 3,  title: "Arquitectura de Información", description: "En este módulo se presentan los conceptos básicos de la arquitectura de información, incluyendo wireframes, prototipos y mapas de sitio. Se espera que los estudiantes comprendan la importancia de la organización y presentación de la información en aplicaciones web." },
    # { program: @program, number: 4,  title: "HTML - Estructura", description: "Este módulo introduce los conceptos básicos de HTML, incluyendo la estructura de un documento HTML, etiquetas principales y atributos. Se espera que los estudiantes comprendan cómo se organiza y presenta la información en una página web." },
    # { program: @program, number: 5,  title: "CSS - Styling", description: "En este módulo se presentan los conceptos básicos de CSS, incluyendo selectores, propiedades y valores. Se espera que los estudiantes comprendan cómo se aplica el estilo a una página web y cómo se organiza la información visualmente." },    
#     { program: @program, number: 4,  title: "El desarrollador FrontEnd" },
#     { program: @program, number: 5,  title: "CSS - Styling" },
#     { program: @program, number: 6,  title: "Variables, Operadores y Estructuras de Datos" },
#     { program: @program, number: 7,  title: "El desarrollador Backend" },
    # { program: @program, number: 8,  title: "Programación Orientada a Objetos - Modelado de Datos (Java)" },
    # { program: @program, number: 9,  title: "Bases de Datos Relacionales con SQLite (Java + Spring Boot)" },
#     { program: @program, number: 10, title: "El desarrollador FullStack" },
#     { program: @program, number: 11, title: "Javascript" },
#     { program: @program, number: 12, title: "Visualización de Datos (Python)" }
# ])
# 
# # content_type
# # objective
# # exercises
# # homework
# # comments
# # reference_material
# # credits_and_sources
# 
# @theme = Theme.find_by_number(1)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Qué es IT, generalidades de la programación" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Breviario Técnico: Arquitectura del Stack" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Instalación y Configuración de Ambientes" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Editores de Código e IDEs" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Control de Versiones con Git" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(2)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Pensamiento computacional", objective: "Comprender cómo descomponer problemas y abordarlos de forma lógica." })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Algoritmos y lógica computacional", objective: "Entender la lógica secuencial y condicional para resolver problemas." })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Diagramas de flujo", objective: "Visualizar los pasos de un algoritmo mediante diagramas." })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Pseudocódigo", objective: "Expresar algoritmos con lenguaje simple, estructurado." })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(3)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es y para qué sirve?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Wireframes y prototipos" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Flujo de navegación" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Introducción a vistas / Mapas de sitio" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(4)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es el frontend?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Estructura básica de un documento HTML" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Etiquetas principales: títulos, párrafos, listas, tablas" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Enlaces e imágenes" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(5)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Sintaxis y selectores" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Colores, tipografía y espaciado" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Box model y layout" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Estilos responsive básicos" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(6)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Variables y Tipos de Datos Primitivos" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Operadores en Java" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Estructuras de Datos Básicas" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Conversión de Tipos y Casting" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(7)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un backend?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Estructuras de Control (Condicionales)" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Bucles (Ciclos Definidos e Indefinidos)" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Funciones (Modularidad y Reutilización)" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(8)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es un modelo de datos?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Atributos y clases en Java" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Relaciones entre modelos" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Buenas prácticas en modelado" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(9)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué es una base de datos relacional?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Creación de tablas con SQL" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Integración con Spring Boot" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Consultas básicas: SELECT, INSERT, UPDATE, DELETE" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(10)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un programador fullstack?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Patrón MVC: Modelo-Vista-Controlador" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Implementar operaciones CRUD" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Validación de datos" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Enrutamiento y endpoints REST" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(11)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "Sintaxis y variables" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Interactividad: Eventos y DOM" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Visualización de datos" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Visualización dinámica de datos" })
# puts topic.errors.full_messages unless topic.valid?
# 
# @theme = Theme.find_by_number(12)
# topic = Topic.create({ theme: @theme, number: 1, estimated_time: 20, title: "¿Qué hace un cientifico de datos?" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 2, estimated_time: 20, title: "Introducción a Python y entornos interactivos" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 3, estimated_time: 20, title: "Librerías para visualización: matplotlib y seaborn" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 4, estimated_time: 20, title: "Lectura de datos desde la API" })
# puts topic.errors.full_messages unless topic.valid?
# topic = Topic.create({ theme: @theme, number: 5, estimated_time: 20, title: "Análisis visual simple" })
# puts topic.errors.full_messages unless topic.valid?