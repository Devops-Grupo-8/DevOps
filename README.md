<img style="display:block;text-align:center" src="Extras/ORT.png" width=100% title="static">

## Universidad ORT Uruguay 

#### Facultad de Ingeniería 
#### Documentación de obligatorio 
#### Certificado en DevOps 
#### Estudiantes grupo 8: Vicente Cersosimo – Ramiro Gonzalez 
#### Tutor: Federico Barceló 2023

## Presentación del problema
Una empresa del sector retail desea modernizar la forma en que desarrollan y realizan el delivery del software de su plataforma. Para esto, uno de sus “C-Levels” propone impulsar un modelo DevOps con el fin de mejorar el time-to-market y calidad del software desarrollado in-house. 

Se ha conformado un equipo de trabajo multidisciplinario con la tarea de promover y llevar a cabo este proceso de modernización a las áreas de desarrollo, calidad y operación. Además, la empresa tiene interés en explorar estrategias de automatización y escalabilidad para el despliegue de sus aplicaciones.

Entre las principales tareas del equipo, deberán de analizar distintas herramientas para lograr los objetivos expresados, además de la implementación y documentación del proyecto.

## Objetivos
El objetivo de este proyecto es implementar un flujo de desarrollo y despliegue continuo (CI/CD) para una aplicación frontend y cuatro aplicaciones backend. Para lograr esto, el equipo utilizará un tablero Kanban para la planificación y seguimiento de las tareas, y desarrollará los ciclos de integración y entrega continua en cada una de las aplicaciones en los ambientes de Dev, Test y Prod. Además, se aplicarán pruebas sobre las aplicaciones de backend o la aplicación frontend elegida, que pueden incluir pruebas de carga, pruebas automatizadas con herramientas como Postman, Selenium, entre otras, y se registran los resultados para evaluar el rendimiento de la misma. Asimismo, se utilizará alguna herramienta de análisis de código estático en todas las aplicaciones del proyecto, generando un informe con los resultados obtenidos del análisis de código, identificando posibles problemas y recomendando mejoras para aumentar la calidad y seguridad del código fuente.

## Solución Propuesta
Nuestra solución propone adoptar la metodología DevOps para mejorar el desarrollo y entrega de software. Mediante una colaboración estrecha entre equipos y la automatización de procesos, buscamos acelerar el time-to-market y garantizar la calidad del software. 
A continuación se explicaran los cambios implementados en cada una de las áreas.

### Infraestructura 
En el ámbito de la infraestructura, hemos logrado una modernización significativa al adoptar un enfoque descentralizado basado en microservicios. Esta arquitectura permite una escalabilidad más eficiente tanto vertical como horizontalmente. Además, hemos migrado a una infraestructura en la nube, aprovechando Terraform para implementar una gestión de infraestructura como código (IaC) y haciendo uso de los servicios de AWS.

### Manejo de repositorios y versionado
Para la solución propuesta se implementaron dos tipos de repositorios. por un lado, se implementó un repositorio para cada uno de los microservicios y por otro se implementó un repositorio que lo llamamos DevOps, con el fin de guardar todo lo vinculado a la infraestructura como código y todo los archivos relacionados al ciclo de deploy continuo.
- **Repositorios Microservicios:** En dichos repositorios se encuentra todo el desarrollo de cada uno de los microservicios y lo relacionado a los archivos de integración continua. Como modelo de flujo de trabajo de ramificación para la gestión del desarrollo y mantenimiento de cada una de las aplicaciones se utilizó GitFlow, con el fin de llevar el control de cada una de las versiones del código. En cada uno de estos repositorios se definieron tres ramas estables como son, master, dev y test.

<img style="display:block;text-align:center" src="Extras/Imagen Gitflow.png" width=100% title="static">

- **Repositorio DevOps:** En este repositorio se encuentran los archivos del código que genera la infraestructura, así como los relacionados con el ciclo de Continuous Deployment (CD). Optamos por utilizar la estrategia de desarrollo Trunk Based, donde mantenemos una única rama principal llamada 'main' para el desarrollo de software.

<img style="display:block;text-align:center" src="Extras/Imagen TrunkBased.png" width=100% title="static">
