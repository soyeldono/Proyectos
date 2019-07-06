float x; //variable aux




void setup(){
  size(500,500); //tamaño de la ventana
  //translate(300,300);
  background(255); //fondo de color blanco
  
  stroke(0); //ya ni se para que es esto pero mejor dejenla ahi 
  
  
  //Nuestros planos  X,Y
  line(0,height/2 + 200 ,width,height/2 +200); //horizontal X
  line(width/2 - 100 ,0,width/2 - 100,height); //vertical Y
  
  
  F(); // F(x) = x**2 + 0.25
  base(); // F(x) = x
  ciclo(0.2,1); //Ciclo, la linea de color verde
  
}




//No necesitamos la funcion draw, solo basta con que se ejecute una sola vez el programa
void draw(){
}





//F(x) = x, la recta 
void base(){
  strokeWeight(1); // aumentamos el grosor del punto para que sea visible
  stroke(0,0,255); // le cambiamos el color para que sea mas bonito, azul
  for(float i=0; i<100;i=i+0.0001){ // este ciclo crea los puntos de la funcion
    x = i; //coordenada X
    point(width/2 - 100 + i*600,height/2+ 200 + x*-600); // linea recta hacia arriba-derecha
    point(width/2 - 100 + i*-600, height/2+ 200 + x*600); //linea recta hacia abajo-izquierda
  }
}




// F(x) = x**2 + 0.25, parabola
void F(){
  strokeWeight(1); //aumentamos el grosor del punto para que sea visible
  stroke(255,0,0); // le cambiamos el color para que sea mas bonito, rojo
  for(float i=0; i<100;i=i+0.0001){ // este ciclo crea los puntos de la parabola
    x = i*i + 0.25; // coordenada X
    point(width/2 - 100 + i*600,height/2 + 200 + x*-600); //parte derecha de la parabola
    point(width/2 - 100 + i*-600, height/2 + 200 + x*-600); //parte izquierda de la parabola
  }
}




/*
  Esta funcion de aqui es el ciclo, linea verde, donde: 
    float m: Es el punto X0, que en este caso es 0.2
    int c: Es la condicional para que no entre en un bucle infinito la recursividad
*/
void ciclo(float m,int c){
    strokeWeight(1); //aumentamos el grosor del punto para que sea visible
    stroke(0,255,0); // le cambiamos el color para que sea mas bonito
    x = m*m + 0.25; //coordenada X
    line(width/2 - 100 + m*600, height/2 + 200, width/2 - 100 + m*600, height/2 + 200 + x*-600); //esta linea es la vertical
    line(width/2 - 100 + m*600, height/2 + 200 + x*-600, width/2 -100 + x*600, height/2 + 200 + x*-600); //esta linea es la horizontal
    c++; //le sumamos uno a la condicional
    if(c<10){ //verificamos que no entre en buble infinito
      ciclo(x,c); //recursividad, x es el punto anterior
    }
}
