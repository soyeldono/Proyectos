# Proyectos
---

Estos son algunos de mis proyectos que he hecho durante casi 3 años y al haber tantos usaré este documento para explicar de que trata cada uno a detalle. 

# PYTHON

Antes de continuar con las explicaciones, hay que tener instalados ciertos programas y librerías para el funcionamiento de los siguientes archivos:

1.- Python >= 3.6 (lenguaje de programación) -- https://www.python.org/downloads/

2.- Jupyter lab/notebook (ambiente) **Si usas Windows recomiendo que lo hagas con conda, si usas Linux necesitar el virtualenv y ipykernel**

3.- Sklearn (Librería) -- pip3 install scikit-learn / conda install scikit-learn

4.- Matplotlib (Librería) -- pip3 install matplotlib / conda install matplotlib

5.- NumPy (Librería) -- pip3 install numpy / conda install numpy

### Python-Simulaciones

**Onda.py** Este documento no tiene mucho de qué hablar, consiste en simular unas ondas de agua, pero el problema llegaba en que las fórmulas para poder hacer la simulación dependían del resultado de la malla adelante de ella por lo que se usó la técnica de "los puntos fantasmas" que consiste en que los puntos exteriores su resultado sea 0.

Para ejecutar el archivo "python Onda.py"

### Python-MachineLearning

# Bosques Aleatorios

**Para poder ver este archivo es necesario abrirlo con Jupyter**

Este es un trabajo en el cual consiste en saber cuales personas dieron click a una publicidad dado algunos datos (tipo de cel, fecha, etc.…), para ello se usó los bosques aleatorios. En el problema se plantea que se deben usar más de 40 combinaciones, pero debido a que eran demasiadas fueron recortadas por las que dieron los mejor resultados.

# Inicio a las Redes Neuronales

**Para poder ver este archivo es necesario abrirlo con Jupyter**

En esta red carga los datos de **iris** y se quiere separar ambos conjuntos mostrados, por lo que se sustituyen algunas cosas (esto porque este ejercicio es reciclado de uno previo). Para poder ver más a detalle lo que hace, se implementó una vista que permite ver cada uno de los cambios en lo que aprende la red.

# PySklearn

Este archivo es un proyecto final en el cual programé Sklearn pero en Python, esto con el fin de poder paralelizarlo después, más sin embargo hubieron problemas y no pude hacerlo. Traté de hacerlo de tal forma que sea como una librería y a su vez lo dejé lo más parecido a Sklearn para evitar problemas de nomenclatura. Para poder hacer esta "librería" tuve que leer demasiado la documentación de Sklearn y a su vez hacer demasiadas pruebas con la librería para así obtener el resultado deseado. Y por último **todos** los nombres de las funciones de Sklearn solo se les añadió el "Py" al inicio (Ejemplo, Sklearn:GridSearchCV - PySklearn:PyGridSearchCV) 

El contenido de esta "librería" por ahora solo tiene 2 funciones muy usadas de Sklearn:

1.- PyCrossValidation: Este módulo proviene de CrossValidation en Sklearn

2.- PyGridSearchCV: Este módulo proviene de PyGridSearchCV en Sklearn

Para poder comprobar el funcionamiento de este, hasta lo más abajo del archivo viene ejemplos.

---

# Processing 

**Antes de continuar es necesario descargar Processing**

Este era mi proyecto final de processing en el cual podíamos hacer lo que nosotros quisiéramos y en mi caso decidí hacer un "videojuego"

PD: Aun tiene algunos errores que corregir, son minúsculos los errores, pero no he tenido tiempo para solucionarlos.

**Información juego Processing**

Esta carpeta solo muestra **toda** la información para poder hacer el juego, desde los modelos de los personajes hasta el modelo del ambiente, con sus códigos de colores y todo lo relacionado. **Para poder alterar los modelos se requiere entrar a la página Piskel** -- https://www.piskelapp.com/p/agxzfnBpc2tlbC1hcHByEwsSBlBpc2tlbBiAgKDI65_jCAw/edit

**Juego programación Processing**

Aquí solamente está la programación en Processing del videojuego. 


# Processing-SistemasDinamicos

**Grafica1**

Esta fue una tarea en el que consiste de hacer un programa que grafique los puntos atractores de la función, F(x) = x^2 + 0.25. En el cual se ve perfectamente como el punto atractor tiende a ir donde choca la función F y la función identidad.

**Grafica2**

Esta es la opuesta pero igualmente se puede ver que el punto atractor que va al origen.

---

# PaginaWebCancelada

Este como dice su nombre, era un trabajo en el cual sería pagado, pero a principios del proyecto se canceló debido a problemas que tuvo la tienda. Entonces en vez de tirarlo a la basura decidí guardarlo y algún día continuar con el proyecto.

Como pueden observar se vé muy básica por lo mismo de que apenas hubo tiempo. La parte de la derecha que está en blanco ahí se iba a poner las imágenes de los productos de la tienda, la barra de colores tiene esos colores solo para saber cuál "botón" estoy alterando (ayuda visual), la barra de la derecha sería desplegable, etc... 

Aunque ahora no tenga mucho tiempo, estoy seguro que en algún momento terminaré este proyecto aún si no me pagan.
