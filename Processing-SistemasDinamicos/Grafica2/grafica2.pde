float x, a;

void setup(){
  size(500,500);
  
  background(255);
  
  stroke(0); //ya ni se para que es esto pero mejor dejenla ahi 
  
  
  //Nuestros planos  X,Y
  line(0,height/2 + 200 ,width,height/2 +200); //horizontal X
  line(width/2 - 200 ,0,width/2 - 200,height); //vertical Y
  
  base();
  F();
  ciclo(0.2,1);
}

void draw(){
}

//F(x) = x, la recta 
void base(){
  strokeWeight(1); // aumentamos el grosor del punto para que sea visible
  stroke(0,0,255); // le cambiamos el color para que sea mas bonito, azul
  for(float i=0; i<100;i=i+0.0001){ // este ciclo crea los puntos de la funcion
    x = i; //coordenada X
    point(width/2 - 200 + i*1500,height/2+ 200 + x*-1500); // linea recta hacia arriba-derecha
    point(width/2 - 200 + i*-1500, height/2+ 200 + x*1500); //linea recta hacia abajo-izquierda
  }
}

void F(){
  strokeWeight(1); //aumentamos el grosor del punto para que sea visible
  stroke(255,0,0); // le cambiamos el color para que sea mas bonito, rojo  
  for(float i=0; i<100;i=i+0.0001){ // este ciclo crea los puntos de la parabola
    x = i*(1-i); // coordenada X
    point(width/2 - 200 + i*1500,height/2 + 200 + x*-1500); //parte derecha de la parabola
    //point(width/2 - 100 + i*-600, height/2 + 200 + x*-600); //parte izquierda de la parabola
  }

}


void ciclo(float m,int c){
    strokeWeight(1); //aumentamos el grosor del punto para que sea visible
    stroke(0,255,0); // le cambiamos el color para que sea mas bonito
    x = m*(1-m); //coordenada X
    line(width/2 - 200 + m*1500, height/2 + 200 + x*-1500, width/2 -200 + x*1500, height/2 + 200 + x*-1500); //esta linea es la horizontal
    if(c==1){
      line(width/2 - 200 + m*1500, height/2 + 200, width/2 - 200 + m*1500, height/2 + 200 + x*-1500); //esta linea es la vertical
    }
    a = x*(1-x); //coordenada X+1
    //println(a);
    line(width/2 -200 + x*1500, height/2 + 200 + x*-1500,width/2 -200 + x*1500,height/2 +200 + a*-1500); // esta linea es la vertical
    c++; //le sumamos uno a la condicional
    if(c<15){ //verificamos que no entre en buble infinito
      ciclo(x,c); //recursividad, x es el punto anterior
    }
}
