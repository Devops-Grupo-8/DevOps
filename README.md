<p align="center">
<img style="display:block;text-align:center" src="Extras/ORT.png" width=100% title="static">
</p>

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
A continuación se explicarán los cambios implementados en cada una de las áreas.

### Tareas a realizar
En el inicio del proyecto, realizamos un tablero Kanban a modo de establer una hoja de ruta clara en cuanto a las tareas necesarias a realizar para el proyecto y los tiempos que cada una de ellas podría requerir.

Las tareas fueron las siguientes:
<p align="center">
<img style="display:block;text-align:center" src="Extras/Tablero Kanban.jpeg" width=60% title="static">
</p>

### Infraestructura 
En el ámbito de la infraestructura, hemos logrado una modernización significativa al adoptar un enfoque descentralizado basado en microservicios. Esta arquitectura permite una escalabilidad más eficiente tanto vertical como horizontalmente. Además, hemos migrado a una infraestructura en la nube, aprovechando Terraform para implementar una gestión de infraestructura como código (IaC) y haciendo uso de los servicios de AWS.

### Manejo de repositorios y versionado
Para la solución propuesta se implementaron dos tipos de repositorios. por un lado, se implementó un repositorio para cada uno de las aplicaciones y por otro se implementó un repositorio que lo llamamos DevOps, con el fin de guardar todo lo vinculado a la infraestructura como código y todo los archivos relacionados al ciclo de deploy continuo.
- **Repositorios de aplicaciones:** En dichos repositorios se encuentra todo el desarrollo de cada uno de los microservicios y lo relacionado a los archivos de integración continua. Como modelo de flujo de trabajo de ramificación para la gestión del desarrollo y mantenimiento de cada una de las aplicaciones se utilizó GitFlow, con el fin de llevar el control de cada una de las versiones del código. En cada uno de estos repositorios se definieron tres ramas estables como son, main, dev y test.

<p align="center">
<img style="display:block;text-align:center" src="Extras/Imagen Gitflow.png" width=60% title="static">
</p>

- **Repositorio DevOps:** En este repositorio se encuentran los archivos del código que genera la infraestructura, así como los relacionados con el ciclo de Continuous Deployment (CD). Optamos por utilizar la estrategia de desarrollo Trunk Based, donde mantenemos una única rama principal llamada 'main' para el código generado
  
<p align="center">
<img style="display:block;text-align:center" src="Extras/Imagen TrunkBased.png" width=60% title="static">
</p>

### Reglas de protección de las ramas 

Es fundamental resaltar que, desde el inicio del proyecto, establecimos una política sólida en cuanto a la protección de cada una de las ramas de las aplicaciones. Esta medida fue esencial para mantener un seguimiento de todos los cambios realizados en las cuatro aplicaciones por parte de los integrantes del equipo.

Dicha política consistió en tres aspectos fundamentales:

1-Exigir un "pull request" antes de mergear cualquier cambio de código. Esto permitió que todos los cambios fueran revisados y aprobados por otro miembro del equipo antes de ser incorporados a la rama principal.

2-Requerir que las ramas estuvieran actualizadas antes de realizar una fusión. De esta manera, aseguramos que el código estuviera en línea con la última versión de la rama principal y evitamos conflictos potenciales.

3-Aprovechando la integración con SonarCloud en cada uno de los repositorios, se ha implementado un requisito adicional al proceso de merge. Antes de que cualquier miembro del equipo pueda fusionar sus modificaciones, deberá esperar a que el análisis del código por parte de SonarCloud sea exitoso y arroje un resultado positivo.

### Etapas de CI 
#### Análisis de código estático 
Para llevar a cabo el análisis estático del código y la revisión continua, hemos integrado la herramienta SonarCloud en nuestros repositorios en GitHub. Este análisis se ejecuta automáticamente cada vez que se integra código en una de las ramas estables (main, dev, test) de cada una de las aplicaciones

Una vez que se realiza una modificación en el código y se inicia una pipeline, es posible observar el proceso en el que SonarCloud lleva a cabo la verificación del código. A continuación, dejamos una imagen que muestra este proceso en acción:

<p align="center">
<img style="display:block;text-align:center" src="Extras/Testeo Sonnar en Github.jpeg" width=75% title="static">
</p>

#### Analisis de los resultados obtenidos y recomendaciones a implementar.

En general, la mayoría de los repositorios han arrojado resultados positivos, con un resultado final "passed". Sin embargo, es importante señalar que todos los repositorios han reportado algunos "code smells", que son indicativos de problemas o debilidades en el diseño o implementación del software. Estos code smells son importantes de tener en cuenta, ya que nos proporcionan información valiosa sobre áreas de mejora en el código.

##### Enfocandonos en cada uno de los repositorios 

Dentro de cada uno de los repositorios se encontraron los siguientes inconvenientes:

###### orders-service-example
(1) Bug, clasificado como DESTACADO, que apunta a un NullPointerException. Para evitarlo, se podría verificar que la variable en uso no sea nula antes de aplicarla.
(2) Vulnerabilidades de seguridad, una de ellas clasificada como DESTACADA y otra como MENOR. Para evitar problemas de seguridad, se debería restringir el acceso a la información del lado donde el usuario tiene acceso.
(8) Code smells, algunos de los indicadores son: código confuso o rebuscado que se podría refactorizar, otro relacionado con el rendimiento y, por último, un caso de prueba (test case) sin ninguna "Assertion".
Por último, y no menos importante, el 15.6% del código en "orders-service-example" está duplicado, lo cual es algo que se podría refactorizar para reutilizar el código ya generado.

###### payments-service-example
(1) Bug por el guardado y reusado de un objeto Random. El uso de la clase java.util.Random para generar números aleatorios es apropiado. No obstante, es importante tener en cuenta que si este código se ejecuta varias veces en rápida sucesión, es posible obtener el mismo valor de randomOption en diferentes ejecuciones.
(3) Code Smells generados por código confuso, problemas de rendimiento y también un test sin "Assertion".

###### products-service-example
(5) Code Smells, entre ellos por: código confuso, rendimiento, diseño y por un test sin "assertion".

###### shipping-service-example
(7) Code Smells, de los cuales 2 son problemas de rendimiento, 2 por código confuso, 2 por no pasarle tipo a la invocación de un Generic y, por último, un test case sin al menos un "assertion".

###### webapp
(1) Code Smells código confuso. Este se podría simplificar usando un opcional (en este caso: webpackConfigEnv?.isLocal).

Dejamos una imagen mostrando nuestro panel en SonarCloud:
<p align="center">
<img style="display:block;text-align:center" src="Extras/sonnar cloud imagen dashboard.png" width=60% title="static">
</p>

### Testing web app
Realizamos un completo proceso de testeo utilizando Postman para nuestra aplicación web. Verificamos el tiempo de respuesta, asegurándonos de que fuera inferior a 300 ms y que el código de la misma fuera 200. También nos aseguramos de incluir el tipo de contenido adecuado en el header de cada solicitud. Adicionalmente, realizamos una prueba de carga enviando 100 solicitudes con intervalos de 100 ms, de las cuales el 91% obtuvo tiempos satisfactorios.

Link aplicación web : [http://devops-grupo-8-bucket-dev.s3-website-us-east-1.amazonaws.com/]

El codigo implementado para el testeo dentro de la aplicación fue el siguiente:
```
pm.test("La respuesta demora menos de 300ms", ()=>{
    pm.expect(pm.response.responseTime).to.be.below(300)
})

pm.test("La respuesta debe ser correcta", ()=>{
    pm.response.to.be.ok; //codigo 200
    pm.response.to.be.withBody; //tener body
})

pm.test("La respuesta debe tener el tipo de contenido correcto", () => {
    pm.response.to.have.header("Content-Type");
});

let requestsCounter = 0;
const maxRequests = 100; // Número máximo de solicitudes a realizar
const interval = 100; // Intervalo entre cada solicitud (en milisegundos)
const testDuration = 10000; // Duración total de la prueba (en milisegundos)

function makeRequest() {
    pm.sendRequest(pm.request.url, (err, response) => {
        requestsCounter++;

        if (err) {
            console.log(`Error en la solicitud ${requestsCounter}: ${err}`);
        } else {
            console.log(`Solicitud ${requestsCounter}: Tiempo de respuesta ${response.responseTime} ms`);
            pm.expect(response.responseTime).to.be.below(300); // Verifica el tiempo de respuesta
        }

        if (requestsCounter === maxRequests) {
            clearInterval(intervalId);
        }
    });
}

const intervalId = setInterval(makeRequest, interval);

setTimeout(() => {
    console.log(`Se realizaron ${requestsCounter} solicitudes en ${testDuration} ms.`);
    pm.test("Prueba de carga finalizada", () => {
        pm.expect(requestsCounter).to.equal(maxRequests); // Verifica que se hayan realizado todas las solicitudes
    });
}, testDuration);
```

A continuación dejamos la evidencia relacionada a dicho test:

<p align="center">
<img style="display:block;text-align:center" src="Extras/Postman Test.jpeg" width=75% title="static">
</p>
