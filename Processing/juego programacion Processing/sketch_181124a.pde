//todas las cosas necesarias para el personaje
int i=0,t=0; //manejan la animacion del pesonaje
PImage ppsf1,ppsf2,ppsf3,ppsf4; 
PImage[] animCaminarS=new PImage[4]; //guardamos todos los fotogramas en un array para usarlas en la animacion de caminar hacia abajo
PImage[] animCaminarD=new PImage[4];
PImage[] animCaminarA=new PImage[4];
PImage[] animCaminarW=new PImage[4];
float movX=width/2,movY=height/2; //estas variables manejan el movimiento del personaje
int estado=1; //el estado maneja en que posicion esta mirando el personaje

//menu Personaje
PImage corazon,corazonVacio;
int vida=4;


//detalles
PImage fondo;
PImage arbol1,rocas1;
PImage pasto;
int[] posPastoX=new int[80];
int[] posPastoY=new int[80];
PImage flor;
int[] posFlorX=new int[15];
int[] posFlorY=new int[15];
PImage lago1;

//todas las cosas necesarias para los slimes
int i1=0,t1=0,i2=0,t2=0,i3=0,t3=0,i4=0,t4=0,i5=0,t5=0; //maneja la animacion del slime
PImage[] animMoverSlime=new PImage[4];
PImage[] animMoverSlime1=new PImage[4];
PImage[] animMoverSlime2=new PImage[4];
PImage[] animMoverSlime3=new PImage[4];
PImage[] animMoverSlime4=new PImage[4];
float posX1=int(random(100,400)),posY1=int(random(100,400)),posX2=int(random(100,400)),posY2=int(random(100,400)),posX3=int(random(100,400)),posY3=int(random(100,400)),posX4=int(random(100,400)),posY4=int(random(100,400)),posX5=int(random(100,400)),posY5=int(random(100,400));
int vidaSlime1=5,vidaSlime2=5,vidaSlime3=5,vidaSlime4=5;
int reaSlime1=int(random(1,100)),reaSlime2=int(random(1,100)),reaSlime3=int(random(1,100)),reaSlime4=int(random(1,100));

//ataque del slime
int at=0,ta=0;

//muerte
int x=255;

void setup(){
  size(500,500); 
  
  //lista para caminar hacia abajo
  animCaminarS[0]=loadImage("f1.png");
  animCaminarS[1]=loadImage("f2.png");
  animCaminarS[2]=loadImage("f1.png");
  animCaminarS[3]=loadImage("f3.png");
  
  //lista para caminar hacia la derecha
  animCaminarD[0]=loadImage("df1.png");
  animCaminarD[1]=loadImage("df2.png");
  animCaminarD[2]=loadImage("df1.png");
  animCaminarD[3]=loadImage("df2.png");
  
  //lista para caminar hacia la izquierda
  animCaminarA[0]=loadImage("af1.png");
  animCaminarA[1]=loadImage("af2.png");
  animCaminarA[2]=loadImage("af1.png");
  animCaminarA[3]=loadImage("af2.png");
  
  //lista para caminar hacia arriba
  animCaminarW[0]=loadImage("wf1.png");
  animCaminarW[1]=loadImage("wf2.png");
  animCaminarW[2]=loadImage("wf1.png");
  animCaminarW[3]=loadImage("wf3.png");
  
  //arboles del diseño 1
  arbol1=loadImage("arbol1.png");
  
  //rocas del diseño 1
  rocas1=loadImage("Roca.png");
  
  //carga el fondo verde
  fondo=loadImage("fondo1.png");
  
  //flor
  flor=loadImage("Flor 1.png");
  for(int w=0;w<15;w++){
    posFlorX[w]=int(random(10,400));
    posFlorY[w]=int(random(10,400));
  }
  
  //lista para el slime 1
  animMoverSlime[0]=loadImage("Slime f1.png");
  animMoverSlime[1]=loadImage("Slime f2.png");
  animMoverSlime[2]=loadImage("Slime f3.png");
  animMoverSlime[3]=loadImage("Slime f1.png");
  
  //lista para el slime 2
  animMoverSlime1[0]=loadImage("Slime f1.png");
  animMoverSlime1[1]=loadImage("Slime f2.png");
  animMoverSlime1[2]=loadImage("Slime f3.png");
  animMoverSlime1[3]=loadImage("Slime f1.png");
  
  //pasto
  pasto=loadImage("Pasto1.png");
  for(int m=0;m<80;m++){
    posPastoX[m]=int(random(10,400));
    posPastoY[m]=int(random(10,400));
  }
  
  //lago(s)
  lago1=loadImage("Lago 1.png");
  
  //vida
  corazon=loadImage("Vida 1.png");
  corazonVacio=loadImage("Vida 2.png");
}




void draw(){
  background(fondo);
  
  //posiciones del ambiente
  
  //pasto
  for(int m=0;m<80;m++){
    image(pasto,posPastoX[m],posPastoY[m]);
  }
  
  //flor
  for(int w=0;w<15;w++){
    image(flor,posFlorX[w],posFlorY[w]);
  }
  
  //arboles
  image(arbol1,width-60,0);
  image(arbol1,width-(60*2),0);
  image(arbol1,width-(60*3),0);
  image(arbol1,width-(60*4),0);
  //image(arbol1,width-(60*5),0);
  image(arbol1,width-60,50);
  image(arbol1,width-(60*2),50);
  image(arbol1,width-(60*3),50);
  //image(arbol1,width-(60*4),50);
  //image(arbol1,width-(60*5),50);
  image(arbol1,width-60,100);
  
  
  
  //lago(s)
  image(lago1,width-135,105);
  
  //rocas
  image(rocas1,55,height-60);
  image(rocas1,0,height-60);
  image(rocas1,0,height-110);
    
  //slime
  if(vidaSlime1>0){
    animacionSlimes(13); //1
  }
  else if(vidaSlime1<=0){
    posX1=-20;
    posY1=-20;
  }
  if(vidaSlime2>0){
    animacionSlimes1(13); //2
  }
  else if(vidaSlime2<=0){
    posX2=-20;
    posY2=-20;
  }
  if(vidaSlime3>0){
    animacionSlimes2(13); //3
  }
  else if(vidaSlime3<=0){
    posX3=-20;
    posY3=-20;
  }
  if(vidaSlime4>0){
    animacionSlimes3(13); //4
  }
  else if(vidaSlime4<=0){
    posX4=-20;
    posY4=-20;
  }
  
  
  
  //pruebas con el slime 1
  if(abs(posX1-movX)<=80 && abs(posY1-movY)<=80){
    if(posX1>movX){ //prueba si el slime esta mas a la derecha que el personaje
      //print("slime mayor");
      posX1-=0.3;
    }
    else if(posX1<movX){ //prueba si el personaje esta mas a la derecha que el slime
      //print("jugador mayor");
      posX1=posX1+0.3;
    }
    if(posY1>movY){
      posY1-=0.3;
    }
    else if(posY1<movY){
      posY1+=0.3;
    }
  }
  
  //pruebas con el slime 2
  if(abs(posX2-movX)<=80 && abs(posY2-movY)<=80){
    if(posX2>movX){ //prueba si el slime esta mas a la derecha que el personaje
      //print("slime mayor");
      posX2-=0.3;
    }
    else if(posX2<movX){ //prueba si el personaje esta mas a la derecha que el slime
      //print("jugador mayor");
      posX2=posX2+0.3;
    }
    if(posY2>movY){
      posY2-=0.3;
    }
    else if(posY2<movY){
      posY2+=0.3;
    }
  }
  
  //pruebas con el slime 3
  if(abs(posX3-movX)<=80 && abs(posY3-movY)<=80){
    if(posX3>movX){ //prueba si el slime esta mas a la derecha que el personaje
      //print("slime mayor");
      posX3-=0.3;
    }
    else if(posX3<movX){ //prueba si el personaje esta mas a la derecha que el slime
      //print("jugador mayor");
      posX3=posX3+0.3;
    }
    if(posY3>movY){
      posY3-=0.3;
    }
    else if(posY3<movY){
      posY3+=0.3;
    }
  }
  
  //pruebas con el slime 4
  if(abs(posX4-movX)<=80 && abs(posY4-movY)<=80){
    if(posX4>movX){ //prueba si el slime esta mas a la derecha que el personaje
      //print("slime mayor");
      posX4-=0.3;
    }
    else if(posX4<movX){ //prueba si el personaje esta mas a la derecha que el slime
      //print("jugador mayor");
      posX4=posX4+0.3;
    }
    if(posY4>movY){
      posY4-=0.3;
    }
    else if(posY4<movY){
      posY4+=0.3;
    }
  }
  
  if(movX+2>=width-(60*5)-25 && movY<=47){
    if(movX<width-(60*5)-25)
      movX-=2;
  }
  //prueba la posicion del pesonaje y dependiendo del estado esta mirando a un lado u otro
  if(estado==1)
    image(animCaminarS[i],movX,movY);
  else if (estado==2)
    image(animCaminarD[i],movX,movY);
  else if (estado==3){
    image(animCaminarA[i],movX,movY);
  }
  else if (estado==4){
    image(animCaminarW[i],movX,movY);
  }
  
  //vida
  switch(vida){
    case 4:
      image(corazon,0,0); //corazon 1
      image(corazon,20,0); //corazon 1
      image(corazon,40,0); //corazon 1
      image(corazon,60,0); //corazon 1
      break;
    case 3:
      image(corazon,0,0); //corazon 1
      image(corazon,20,0); //corazon 1
      image(corazon,40,0); //corazon 1
      image(corazonVacio,60,0); //corazon 2
      break;
    case 2:
      image(corazon,0,0); //corazon 1
      image(corazon,20,0); //corazon 1
      image(corazonVacio,40,0); //corazon 2
      image(corazonVacio,60,0); //corazon 2
      break;
    case 1:
      image(corazon,0,0); //corazon1
      image(corazonVacio,20,0); //corazon 2
      image(corazonVacio,40,0); //corazon 2
      image(corazonVacio,60,0); //corazon 2
      break;
    case 0:
      image(corazonVacio,0,0); //corazon 2
      image(corazonVacio,20,0); //corazon 2
      image(corazonVacio,40,0); //corazon 2
      image(corazonVacio,60,0); //corazon 2
  }
 
 //reaparecer slimes
 if(vidaSlime1<=0){
   int aux=int(random(1,100));
   if(aux==reaSlime1){
     vidaSlime1=5;
     posX1=int(random(100,400));
     posY1=int(random(200,400));
   }
 }
 if(vidaSlime2<=0){
   int aux1=int(random(1,100));
   if(aux1==reaSlime2){
     vidaSlime2=5;
     posX2=int(random(100,400));
     posY2=int(random(200,400));
   }
 }
 if(vidaSlime3<=0){
   int aux2=int(random(1,100));
   if(aux2==reaSlime3){
     vidaSlime3=5;
     posX3=int(random(100,400));
     posY3=int(random(200,400));
   }
 }
 if(vidaSlime4<=0){
   int aux3=int(random(1,100));
   if(aux3==reaSlime4){
     vidaSlime4=5;
     posX4=int(random(100,400));
     posY4=int(random(200,400));
   }
 }
 
 //prueba de los corazon del jugador
  while(vida<=0){
    animMuerte();
  }
}

void keyPressed(){
  //teclas para mover
  if(vida>0){
    switch(key){
      case 's':
        estado=1; //abajo
        movY+=2;
        animacionCaminarS(10);
        break;
      case 'd':
        //i=0;
        estado=2; //derecha
        movX+=2;
        animacionCaminarD(10);    
        break;
      case 'a':
        estado=3;  //izquierda
        movX-=2;
        animacionCaminarA(10);
        break;
      case 'w':
        estado=4;  //arriba
        movY-=2;
        animacionCaminarW(10);
      }
  }
}
//------------------------------------------------------------------------------------------------------------------------------------


void mousePressed(){
  
  //golpear slime1
  if(estado==1 && movY+39>=posY1 && abs(movX-posX1)<45 && abs(movY-posY1)<45){
    vidaSlime1--;
  } 
  if(estado==2 && movX+39>=posX1 && abs(movX-posX1)<45 && abs(movY-posY1)<45){
    vidaSlime1--;
  }
  if(estado==3 && movX-39<=posX1 && abs(movX-posX1)<45 && abs(movY-posY1)<45){
    vidaSlime1--;
  }
  if(estado==4 && movY-39<=posY1 && abs(movX-posX1)<45 && abs(movY-posY1)<45){
    vidaSlime1--;
  }
  
  //golpear slime 2
  if(estado==1 && movY+39>=posY2 && abs(movX-posX2)<45 && abs(movY-posY2)<45){
    vidaSlime2--;
  } 
  if(estado==2 && movX+39>=posX2 && abs(movX-posX2)<45 && abs(movY-posY2)<45){
    vidaSlime2--;
  }
  if(estado==3 && movX-39<=posX2 && abs(movX-posX2)<45 && abs(movY-posY2)<45){
    vidaSlime2--;
  }
  if(estado==4 && movY-39<=posY2 && abs(movX-posX2)<45 && abs(movY-posY2)<45){
    vidaSlime2--;
  }
  
  //golpear slime 3
  if(estado==1 && movY+39>=posY3 && abs(movX-posX3)<45 && abs(movY-posY3)<45){
    vidaSlime3--;
  } 
  if(estado==2 && movX+39>=posX3 && abs(movX-posX3)<45 && abs(movY-posY3)<45){
    vidaSlime3--;
  }
  if(estado==3 && movX-39<=posX3 && abs(movX-posX3)<45 && abs(movY-posY3)<45){
    vidaSlime3--;
  }
  if(estado==4 && movY-39<=posY3 && abs(movX-posX3)<45 && abs(movY-posY3)<45){
    vidaSlime3--;
  }
  
  //golpear slime 4
  if(estado==1 && movY+39>=posY4 && abs(movX-posX4)<45 && abs(movY-posY4)<45){
    vidaSlime4--;
  } 
  if(estado==2 && movX+39>=posX4 && abs(movX-posX4)<45 && abs(movY-posY4)<45){
    vidaSlime4--;
  }
  if(estado==3 && movX-39<=posX4 && abs(movX-posX4)<45 && abs(movY-posY4)<45){
    vidaSlime4--;
  }
  if(estado==4 && movY-39<=posY4 && abs(movX-posX4)<45 && abs(movY-posY4)<45){
    vidaSlime4--;
  }
}


//--------------------------------------------------ANIMACIONES DEL PERSONAJE--------------------------------------------------
void animacionCaminarS(int velocidad){
  if(t==velocidad){
    i++;
    t=0;
    if(i==4){
      i=0;
    }
  }
  t++;
}

void animacionCaminarD(int vel){
  if(t==vel){
    i++;
    t=0;
    if(i==4){
      i=0;
    }
  }
  t++;
}

void animacionCaminarA(int vel){
  if(t==vel){
    i++;
    t=0;
    if(i==4){
      i=0;
    }
  }
  t++;
}

void animacionCaminarW(int vel){
  if(t==vel){
    i++;
    t=0;
    if(i==4){
      i=0;
    }
  }
  t++;
}
//---------------------------------------------------FIN DE LA ANIMACION DEL PERSONAJE----------------------------------------------


//------------------------------------------------------ANIMACION DEL SLIME---------------------------------------------------------

//slime1
void animacionSlimes(int vel){ //slime 1
  if(vidaSlime1>0){
    image(animMoverSlime[i1],posX1,posY1);
    if(t1==vel){
      i1++;
      t1=0;
      if(i1==4){
        i1=0;
      }
    }
    t1++;
    ataqueSlime(7);
  }
}

//slime2
void animacionSlimes1(int vel){ 
  if(vidaSlime2>0){
    image(animMoverSlime[i2],posX2,posY2);
    if(t2==vel){
      i2++;
      t2=0;
      if(i2==4){
        i2=0;
      }
    }
    t2++;
    ataqueSlime(7);
  }
}

//slime 3
void animacionSlimes2(int vel){ 
  if(vidaSlime3>0){
    image(animMoverSlime[i3],posX3,posY3);
    if(t3==vel){
      i3++;
      t3=0;
      if(i3==4){
        i3=0;
      }
    }
    t3++;
  }
}

//slime 4
void animacionSlimes3(int vel){ 
  if(vidaSlime4>0){
    image(animMoverSlime[i4],posX4,posY4);
    if(t4==vel){
      i4++;
      t4=0;
      if(i4==4){
        i4=0;
      }
    }
    t4++;
  }
}

//---------------------------------------------FIN ANIMACION SLIME--------------------------------------


//------------------------------------------------ATAQUE DEL SLIME----------------------------------------
void ataqueSlime(int vel){
  float auxMovX=movX-posX1; //slime 1
  float auxMovX1=movX-posX2; //slime 2
  float auxMovX2=movX-posX3; //slime 3
  float auxMovX3=movX-posX4; //slime 4
  //println(auxMovX1);
  //println(abs(movX-posX2));
  
  //pruebas para el slime 1
  if(auxMovX<0 && abs(movX-posX1)<=35 && abs(movY-posY1)<=10){  //hacer daño por el lado izquierdo
    //print("ad");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<=0){
          vida=0;
        }
      }
    }
    ta++;
  }
  else if(auxMovX>0 && abs(movX-posX1)<=35 && abs(movY-posY1)<=10){  //hacer daño por el lado derecho
    //print("as");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
  
  
  //pruebas para el slime 2
  if(auxMovX1<0 && abs(movX-posX2)<=35 && abs(movY-posY2)<=10){ //daño por el lado izquierdo
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
  else if(auxMovX1>0 && abs(movX-posX2)<=35 && abs(movY-posY2)<=10){  //hacer daño por el lado derecho
    //print("as");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
  
  //slime 3
  if(auxMovX2<0 && abs(movX-posX3)<=35 && abs(movY-posY3)<=10){  //hacer daño por el lado izquierdo
    //print("ad");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
  else if(auxMovX2>0 && abs(movX-posX3)<=35 && abs(movY-posY3)<=10){  //hacer daño por el lado derecho
    //print("as");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
  
  //slime 4
  if(auxMovX3<0 && abs(movX-posX4)<=35 && abs(movY-posY4)<=10){  //hacer daño por el lado izquierdo
    //print("ad");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
  else if(auxMovX3>0 && abs(movX-posX4)<=35 && abs(movY-posY4)<=10){  //hacer daño por el lado derecho
    //print("as");
    if(ta==vel){
    at++;
    ta=0;
      if(at==10){
        vida--;
        at=0;
        //ta=0;
        if(vida<0){
          vida=0;
        }
      }
    }
    ta++;
  }
}

//-------------------------------------FIN ATAQUE SLIME-----------------------------------------------------

//------------------------------------------ANIMACION DE MUERTE-------------------------------------------------
void animMuerte(){
  //print("ak");
  while(x>0){
    //print('a');
    fill(x);
    rect(10,10,width-10,height-10);
    x--;
  }
}
