#Version alpha del codigo
#!/usr/bin/env python

#Creado por Donovan Mosheh Ramirez Trejo 
__author__ = "Donovan Mosheh Ramirez Trejo"

#Contacto mosheh315@gmail.com
__email__ = "mosheh315@gmail.com"

#Librerias OBLIGATORIAS
import numpy as np #obviamente debe estar libreria, para poder trabajar con matrices
from sklearn import linear_model # Para poder seleccionar cualquier modelo
import math #para poder redondear al numero mas grande (en caso de que dicho numero sea float)
import itertools as it #Para poder sacar todas las combinaciones
from copy import copy #para evitar alterar variables principales
import time #En el debido caso de hacer uso del verbose

#Librerias para los EJEMPLOS
#from sklearn.model_selection import cross_val_score 
from sklearn.model_selection import GridSearchCV


class Pysklearn():

    """
    NOMBRE
        Pysklearn
    
    DESCRIPCION
        Libreria muy basica para Machine Learning, version alpha
        ==========================================================

        Pysklearn es una libreria hecha en Python que permite el uso de algoritmos antiguos de Machine Learning, 
        esta libreria por ahora esta pensada para hacer comparativas entre la version padre (sklearn hecha en C) o para
        hacer manualmente algoritmos de Machine Learning. Esta libreria trata de mantenerse lo mas fiel prosible a la 
        nomenclatura de sklearn, mas sin embargo se recomienda usar el comando "help" para saber si dicha funcion tiene
        lo mismo.

    CONTENIDO

        * PyGridSearchCV 
        * Pymodel_selection

    NOTAS   
        Todas las funciones van a cambiar a futuro, por lo que si se encuentra con cosas diferentes a la version padre 
        se recomiendo ignorarlas mientras se actualiza la libreria

    EJEMPLOS
        import Pysklearn as Psk
        from sklearn.model_selection import cross_val_score
        from sklearn.linear_model import Lasso
        import numpy as np

        X = np.random.rand(30,3)
        y = np.random.rand(30,1)

        model = Lasso(alpha=0.01)

        cros_val_score_pysklearn = Psk.Pymodel_selection.Pycross_val_score(model,X,y,cv=5)
        cros_val_score_sklearn = cross_val_score(model,X,y,cv=5)

        print("Resultado Pysklearn:", cros_val_score_pysklearn)
        >>> [0.15080217 0.35929749 0.21614302 0.0707767  0.36672313]
        print("Resultado sklearn:", cros_val_score_sklearn)
        >>> [0.15080217 0.35929749 0.21614302 0.0707767  0.36672313]
    
    VERSION
        0.1.1 - 1.1Alpha
    """

    class PyGridSearchCV():
        """
        Busqueda por fuerza bruta con parametros especificos para un modelo y un problema en especifico

        PyGridSearchCV hace uso de Pycross_val_score multiples veces para asi encontrar los mejores parametros posibles

        --ATENCION--
        Se recomienda tener un buen equipo puesto que este metodo de busqueda al ser por fuerza bruta, consume demasiados recursos
        tambien se recomienda tener paciencia debido a que estamos en Python y no en C. Estas advertencias depende de lo grande que llegue
        a ser nuestro problema.

        PARAMETROS
        -----
        estimator: class de sklearn, obligatorio
            Es el modelo que se va a usar para el problema
        
        param_grid: diccionario con nombre de los parametros del modelo como llaves, obligatorio
            Es todo el conjunto de parametros que se usaran para evaluear el modelo

        cv: int, defaul=3
            Es la K partes en las que se separaran el conjunto de entrenamiento

        verbose: boolean, default=False
            Sirve para mostrar datos mientras se va haciendo la busqueda en malla

        ATRIBUTOS Y METODOS
        -----
        fit: Metodo
            Sirve para empezar a evaluar nuestros parametros
            
            PARAMETROS
            -----
            X: array de numpy, obligatorio
                Es el conjunto de los datos para entrenar
            
            y: array de numpy, obligatorio
                Es el resultado esperado
            
            REGRESA
            ------
            None, solo sirve para evaluar
        
        best_params_: Atributo
            Sirve para regresar los mejores parametros para nuestro modelo
        """


        #Metodo constructor
        def __init__(self,estimator,param_grid,cv=3,verbose=False):

            #Declaramos las variables
            self.model = estimator
            self.params = param_grid
            self.cv = cv
            self.verbose = verbose
            self.best_params_ = None

        def fit(self,X,y):
            
            if self.verbose:
                time_ = time.time()
            #Listas que guardaran los mejores datos
            best_params, best_mean = [],[]

            #Sacar todas las combinaciones posibles de los parametros que se han dado
            my_dict = self.params
            allNames = sorted(my_dict)
            combinations = it.product(*(my_dict[Name] for Name in allNames))

            #Crear lista y diccionarios auxiliares
            list_variables = list(allNames)
            new_dict = {}

            #Usar todas las combinaciones posibles
            for i in combinations:
                for j,k in enumerate(i):
                    new_dict[list_variables[j]] = k

                #Asignar al modelo una de todas las combinacion que tienen el conjunto de parametros
                new_model = self.model.__class__ 
                model_ = new_model(**new_dict) 

                #Si queremos visualizar los procesos, aplicar el verbose
                if self.verbose != False:
                    print("-----------VERBOSE----------------")
                    self.verbose_(self.params,new_dict,self.verbose,self.model)

                #Evaluamos el modelo con las combinaciones de parametros
                aux = Pysklearn.Pymodel_selection()
                scores = aux.Pycross_val_score(model_,X,y,self.cv)
                scores = np.sqrt(-scores)
                
                #Añadimos lo resultados para luego buscar el mejor
                best_mean.append(np.mean(scores))
                best_params.append(copy(new_dict))
            
            #Buscamos el mejor
            best = (max(best_mean),None)
            for i,j in enumerate(best_mean):
                try:
                    if best_mean[i] < best[0]:
                        best = (best_mean[i],i)
                except:
                    pass

            #Regresamos el mejor
            self.best_params_ = best_params[best[1]]
            if self.verbose:
                print("Tiempo:",time.time()- time_)

        def verbose_(self,param_grid,actual_dic,verbose,model):           
            _a = model.__class__
            _a = _a(**actual_dic)
            print(_a)
            print("Fit Actual:",actual_dic,'\n')

        


    class Pymodel_selection():     
        """
        NOMBRE
            Pysklearn.Pymodel_selection
        
        DESCRIPCION
            Este modulo por ahora solo tiene implementado la validacion cruzada.
        
        FUNCIONES
            Pysklearn.Pymodel_selection.Pycross_val_score()
        """     
          
        def Pycross_val_score(self,modelo,X,y,cv=3):
            """
            Este metodo se encarga de estimar el modelo que se le haya dado usando el propio conjunto de entrenamiento repartiendolo en K partes iguales y probando el modelo con cada uno
            de esos conjuntos.
            
            Donde:
                Conjunto de entrenamiento = (conjunto_prueba / Kfold) - 1 
                Conjunto Prueba = Complemento(Conjunto de entrenamiento)

            PARAMETROS
            ------
            modelo: class de sklearn, obligatorio
                El modelo que se va a estimar

            X: array, obligatorio
                Los datos a los cuales se pasara al modelo
            
            y: array, obligatorio
                Los datos a los cuales se tratara de predecir

            cv: int, opcional default=3
                La cantidad de veces que se va a hacer la validacion cruzada repartiendolo en K partes

            REGRESA
            -------
            Scores: lista de tipo float, tamaño = cv
                Una lista de los estimadores por cada intento de cross validation
            """
            #Declaracion de variables
            self.modelo = modelo
            self.X = X
            self.y = y
            self.cv = cv

            #Lista que guardara los resultados
            guardar_resultados = []

            #Variable que solo guarda el tamaño de separacion del conjunto X
            sub_conjunto = self.X.shape[0]/self.cv

            #Variable que solo guardara el rango de los datos que usaremos para el conjunto de entrenamiento
            guardar_ultimos_valores = (0,math.ceil(sub_conjunto))

            for i in range(self.cv):

                #Conjunto de prueba de tamaño n/cv
                conjunto_prueba_X = self.X[guardar_ultimos_valores[0]:guardar_ultimos_valores[1],:]
                conjunto_prueba_y = self.y[guardar_ultimos_valores[0]:guardar_ultimos_valores[1],:]

                #Creamos la lista para saber los indices que NO seran tomados para el conjunto de entrenamiento
                lista_x = [h for h in range(guardar_ultimos_valores[0]*self.X.shape[1],guardar_ultimos_valores[1]*self.X.shape[1])]
                lista_y = [h for h in range(guardar_ultimos_valores[0],guardar_ultimos_valores[1])]

                #Guardamos los datos que si queremos
                conjunto_entrenamiento_x = np.delete(self.X,lista_x)
                conjunto_entrenamiento_y = np.delete(self.y,lista_y)

                #Añadimos la dimension extra que tiene "y" 
                conjunto_entrenamiento_y = conjunto_entrenamiento_y[:,np.newaxis]


                #--------------------- List to Array ----------------------
                # np.delete regresa una lista con los datos en self.X pero no queremos una lista, queremos un array/matriz, entonces este codigo regresa el/la array/matriz
                l2 = [] #Aux List
                h = 0 #Aux List

                # As its a list we need each index
                for _ in range(int(len(conjunto_entrenamiento_x)/self.X.shape[1])):
                    l1 = []
                    for _ in range(self.X.shape[1]):
                        l1.append(conjunto_entrenamiento_x[h])
                        h += 1
                    l2.append(l1)

                #Transform list to array / Transformamos la lista en un array
                conjunto_entrenamiento_x = np.array(l2)
                #----------------------------------------------------------

                #Evaluamos el modelos con las k partes separadas
                self.modelo.fit(conjunto_entrenamiento_x,conjunto_entrenamiento_y)

                #Sacamos el escore una vez evalueado
                score = self.modelo.score(conjunto_prueba_X,conjunto_prueba_y)

                #Guardamos los resultados
                guardar_resultados.append(score)

                # Este if es por el funcionamiento que tiene cross_val_score de sklearn, la forma en que sklearn separa los datos es diferente. Entonces tuve que ajustarlo para que funcione igual
                if i < self.X.shape[0] % self.cv -1:
                    guardar_ultimos_valores = (guardar_ultimos_valores[1], math.ceil(guardar_ultimos_valores[1] + sub_conjunto))
                else:
                    guardar_ultimos_valores = (guardar_ultimos_valores[1],int(guardar_ultimos_valores[1] + sub_conjunto))

            #Regresamos las evaluaciones
            return np.array(guardar_resultados)
        
        


if __name__ == '__main__':
    #Ejemplos para entender, TODOS los ejemplos estan comentados si quieres ponerlos en practica solo descomentalos

    #Primero creamos el DataSet
    #-ATENCION- estamos usando numeros aleatorios por lo que puede que en algun momento salga un numero imaginario que no soporta python, para evitar esto usar np.random.seed(27)
    X = np.random.rand(1000,500)
    y = np.random.rand(1000,1)

    #Decimos cual modelo vamos a usar, en este ejemplo Lasso
    model = linear_model.Lasso()

    #            EJEMPLO 1 

    #Aplicar Validacion Cruzada y compararlo con el de sklearn (No olvides que hay que importar la libreria, arriba lo deje comentado junto a las otras librerias solo descomentalo)

    #Hacemos llamar a la funcion Pycross_val_score, a su vez vemos los resultados
    #x = Pysklearn.Pymodel_selection()
    #print("Manual:",np.sqrt(-x.Pycross_val_score(model,X,y,5)))

    #Hacemos llamar a la funcion cross_val_socre de sklearn y vemos los resultados
    #score = cross_val_score(model,X,y,cv=5)
    #print("Sklearn:",np.sqrt(-score))
    #Como podemos observar son los mismo

    #            EJEMPLO 2

    #Aplicar la busqueda en Malla y compararlo con el de sklearn (No olvides que hay que importar la libreria, arriba lo deje comentado junto a las otras librerias solo descomentalo)
    #-ATENCION- estamos usando las mismas variables del ejercicio anterior(X,y) y recuerden que son aleatorias por lo que pueden salir errores durante su ejecucion, para evitar esto usar np.random.seed(27)

    #Creamos el diccionario con el conjunto de datos para los parametros que queremos buscar
    di = {"alpha":[0.001,0.1,0.0001],"max_iter":[50,100,1000,10000]}

    #Hacemos llamar a la funcion PyGridSearchCV 
    a = Pysklearn.PyGridSearchCV(model,di,3)

    #Aplicamos la funcion y veamos los resultados
    a.fit(X,y)
    print("Mejor parametro me:",a.best_params_)

    #Hacemos llamar a la funcion GridSearchCV de sklearn
    b = GridSearchCV(model,di,n_jobs=-1,cv=3,iid=True)

    #Aplicamos la funcion y vemos los resultados
    b.fit(X,y)
    print("Mejor parametro skleanr",b.best_params_)
    #Como podemos observar ambos resultados son los mismo

