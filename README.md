# Proyectos
---

Estos son algunos de mi proyectos que he hecho durante casi 3 años y al haber tantos usaré este documento para explicar de que trata uno a detalle. 

# PYTHON

Antes de continuar con las explicaciones, hay que tener instalados ciertos programas y librerias para el funcionamiento de los siguientes archivos:

1.- Python >= 3.6 (lenguaje de programacion) -- https://www.python.org/downloads/
2.- Jupyter lab/notebook (ambiente) **Si usas Windows recomiendo que lo hagas con conda, si usas Linux necesitar el virtualenv y ipykernel**
2.- Sklearn (Libreria) -- pip3 install scikit-learn / conda install scikit-learn
3.- Matplotlib (Libreria) -- pip3 install matplotlib / conda install matplotlib
4.- NumPy (Libreria) -- pip3 install numpy / conda install numpy

### Python-Simulaciones
**Onda.py** Este documento no tiene mucho de que hablar, con siste en simular unas ondas de agua pero el problema llegaba en que las formulas para poder hacer la simulaicion dependian del resultado de la malla adelante de ella por lo que se uso la tenica de "los puntos fantasma" que consiste en que los puntos exteriores su resultado sea 0.

Para ejecutar el archivo "python Onda.py"

### Python-MachineLearning

# Bosques Aleatorios
**Para poder ver este archivo es necesario abrirlo con Jupyter**

Este es un trabajo en el cual consiste en saber cuales personas dieron click a una publicidad dado algunos datos (tipo de cel, fecha, etc...), para ello se uso los bosques aleatorios. En el problema se plantea que se deben usar mas de 40 combinaciones pero debido a que eran demasiadas fueron recoratadas a las que dieron los mejor resultados.

# Inicio a las Redes Neuronales
**Para poder ver este archivo es necesario abrirlo con Jupyter**

En esta red se carga los datos de **iris** y se quiere separar ambos conjuntos mostrados, por lo que se sustituyen algunas cosas (esto porque este ejercicio es reciclado de uno previo). Para poder ver mas a detalle lo que hace, se implemento una vista que permite ver cada uno de los cambios en lo que aprende la red.

# PySklearn

Este archivo es un proyecto final en el cual programe Sklearn pero en Python, esto con el fin de poder paralelizarlo despues, mas sin embargo hubieron problemas y no pude hacerlo. Trate de hacerlo de tal forma que sea como una libreria y a su vez lo deje lo mas parecido a Sklearn para evitar problemas de nomenclatura. Para poder hacer esta "libreria" tuve que leer demasiado la documentacion de Sklearn y a su vez hacer demasiadas pruebas con la libreria para asi obtener el resultado deseado. Y por ultimo **todos** los nombres de las funciones de Sklearn solo se les añadio el "Py" al inicion (Ejemplo, Sklearn:GridSearchCV - PySklearn:PyGridSearchCV) 

El contenido de esta "libreria" por ahora solo tiene 2 funciones muy usadas de Sklearn:

1.- PyCrossValidation: Este modulo proviene de CrossValidation en Sklearn
2.- PyGridSearchCV: Este modulo proviene de PyGridSearchCV en Sklearn

Para poder comprobar el funcionamiento de este, hasta lo mas abajo del archivo viene ejemplos.

---

# Processing 

**Antes de continuar es necesario descargar Processing**

Este era mi proyecto final de processing en el cual podiamos hacer lo que nosotros quisieramos y en mi caso decidi hacer un "videojuego"

PD: Aun tiene algunos errores que corregir, son minusculos los errores pero no he tenido tiempo para solucionarlos.

**Informacion juego Processing**

Esta carpeta solo muestra **toda** la informacion para poder hacer el juego, desde los modelos de los personajes hasta el modelo del ambiente, con sus codigos de colores y todo lo relacionado. **Para poder alterar los modelos se requiere entrar a la pagina Piskel** -- https://www.piskelapp.com/p/agxzfnBpc2tlbC1hcHByEwsSBlBpc2tlbBiAgKDI65_jCAw/edit

**Juego programacion Processing**

Aqui solamente esta la programacion en Processing del videojuego. 


# Processing-SistemasDinamicos

**Grafica1**

Esta fue una tarea en el que consiste de hacer un programa que grafique los puntos atractores de la funcion, F(x) = x^2 + 0.25. En el cual se ve perfectamente como el punto atractor tiene a ir donde choca la funcion F y la funcion identidad.

**Grafica2**

Esta es la opuesta pero igualmente se puede ver que el punto atractor va al origen.

---

# PaginaWebCancelada

Este como dice su nombre, era un trabajo en el cual seria pagado pero, casi casi al comienzo del proyecto se cancelo debido a problemas que tuvo la tienda. Entonces en vez de tirarlo a la basura decidi guardarlo y algun dia continuar con el proyecto.

Como puden observar se ve muy basica por lo mismo de que apenas hubo tiempo. La parte de la derecha que esta en blanco ahi se hiba a poner las imagenes de los productos de la tienda, la barra de colores tiene esos colores solo para saber donde cual "boton" estoy alterando (ayuda visual), la barra de la derecha seria desplegable, etc... 

Aun que ahora no tenga mucho tiempo, estoy seguro que algun momento terminare este proyecto aun si no me pagan.
