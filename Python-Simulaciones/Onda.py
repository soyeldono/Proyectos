import numpy as np
from Plotter3D import MeshPlotter3D, MeshPlotter3DParallel

def initial_conditions(DTDX, X, Y):
    """
    Construir los puntos en la malla y asignar condiciones iniciales.
    X[i,j] y Y[i,j] son las coordenadas 2D de u[i,j].
    """
    assert X.shape == Y.shape
    # Crear arreglos
    um = np.zeros(X.shape)     # u^{n-1}  "u minus"
    u  = np.zeros(X.shape)     # u^{n}    "u"
    up = np.zeros(X.shape)     # u^{n+1}  "u plus"
    # Definir Ix & Iy tales que 1:Ix & 1:Iy definan los puntos interiores
    Ix = u.shape[0] - 1
    Iy = u.shape[1] - 1
    # Asignar los puntos interiores: condiciones iniciales gaussianas
    u[1:Ix,1:Iy] = np.exp(-50 * ((X[1:Ix,1:Iy]-0.5)**2 + Y[1:Ix,1:Iy]**2))
    # Asignar puntos fantasma a las condiciones de frontera
    set_ghost_points(u)
    # Correr en reversa para que la derivada respecto al tiempo
    # sea igual a cero
    apply_stencil(DTDX, um, u, up)
    um *= 0.5
    # Fin de inicializacion de up, u y um
    return up, u, um

def apply_stencil(DTDX, up, u, um):
    """
    Aplicar el estencil computacional para computar u^{n+1} -- "up".
    Asume que los puntos fantasma existen y tienen los valores correctos.
    """
    # Definir Ix & Iy tales que 1:Ix y 1:Iy definen los puntos interiores
    Ix = u.shape[0] - 1
    Iy = u.shape[1] - 1
    # Actualizar puntos interiores con estencil vectorizado
    up[1:Ix,1:Iy] = ((2-4*DTDX)*u[1:Ix,1:Iy] - um[1:Ix,1:Iy]
                     + DTDX*(u[0:Ix-1,1:Iy  ] +
                             u[2:Ix+1,1:Iy  ] +
                             u[1:Ix  ,0:Iy-1] +
                             u[1:Ix  ,2:Iy+1]))

def set_ghost_points(u):
    """
    Asignar los puntos fantasma.
    """
    # Definir Nx y Ny tales que Nx+1 & Ny+1 son los puntos fantasma
    Nx = u.shape[0] - 2
    Ny = u.shape[1] - 2
    # Actualizar puntos fantasma con la condicion de frontera
    u[0,:]    = u[2,:]       # u_{0,j}    = u_{2,j}      x = 0
    u[Nx+1,:] = u[Nx-1,:]    # u_{Nx+1,j} = u_{Nx-1,j}   x = 1
    u[:,0]    = u[:,2]       # u_{i,0}    = u_{i,2}      y = 0
    u[:,Ny+1] = u[:,Ny-1]    # u_{i,Ny+1} = u_{i,Ny-1}   y = 1


if __name__ == '__main__':
    # Constantes
    xmin, xmax = 0.0, 1.0     # Fronteras del dominio
    ymin, ymax = 0.0, 1.0     # Fronteras del dominio
    Nx = 64                   # Numero total de puntos en x
    Ny = Nx                   # Numero total de puntos en y
    dx = (xmax-xmin)/(Nx-1)   # Espaciamiento de la malla, Delta x
    dy = (ymax-ymin)/(Ny-1)   # Espaciamiento de la malla, Delta y
    dt = 0.4 * dx             # Paso de tiempo (factor magico de 0.4)
    T = 5                     # Tiempo total
    DTDX = (dt*dt) / (dx*dx)  # Numero CFL precomputado

    # Indices globales: I[i,j] y J[i,j] son los indices de u[i,j]
    [I,J] = np.mgrid[0:Nx+2, 0:Ny+2]
    # Por conveniencia: u[1:Ix,1:Iy] son todos los puntos interiores
    Ix, Iy = Nx+1, Ny+1

    # Asignar condiciones iniciales
    up, u, um = initial_conditions(DTDX, (I-1)*dx, (J-1)*dy)

    # Inicializar graficador serial: una grafica por proceso
    plotter = MeshPlotter3D()

    # Inicializar graficador paralelo: juntar datos en una sola grafica
    #plotter = MeshPlotter3DParallel()

    for k,t in enumerate(np.arange(0,T,dt)):
        # Computar u^{n+1} con el estencil computacional
        apply_stencil(DTDX, up, u, um)

        # Asignar puntos fantasma en u^{n+1}
        set_ghost_points(up)

        # Intercambiar referencias para el siguiente paso
        # u^{n-1} <- u^{n}
        # u^{n}   <- u^{n+1}
        # u^{n+1} <- u^{n-1}  (sobrescribir en el siguiente paso)
        um, u, up = u, up, um

        # Imprimir y dibujar ocasionalmente
        print("Paso: %d  Tiempo: %f" % (k,t))
        if k % 5 == 0:
            plotter.draw_now(I[1:Ix,1:Iy], J[1:Ix,1:Iy], u[1:Ix,1:Iy])

    plotter.save_now(I[1:Ix,1:Iy], J[1:Ix,1:Iy], u[1:Ix,1:Iy], "OndaFinal.png")
