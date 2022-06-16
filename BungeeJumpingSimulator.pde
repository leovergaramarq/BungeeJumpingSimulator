import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*; Minim audio = new Minim(this); AudioPlayer[] player = new AudioPlayer[4];
import java.util.Scanner;
import javax.swing.JOptionPane;
double ts,t1s,t2s;
boolean bajar, graf[]={false,false,false,false,false,false},todasxd=false,caso=true,mus=true,set=false,anim=true,zoom[]={false,false},helpB=false;//acabo de cambiar los tiempos de float a double
double a,v,y=0,yf,k=5,yb=0;double t=0,t1=0,t2=0,tb=0,ag,tg=0,tmax=0;double l=200,h=500,m=50;double g1[]={9.81,3.711,1.62,15},g=9.81,r=0.8,b,sec,sec1,sec2,sep=0;
double tgant=0,yant=0,vant=0,aant=0;
double vo1=0, vf,xo1=0, pcuerd[]={0.16 , 0.512 , 0.506 , 0.448 , 0.2148 , 0.4946 , 0.51428 , .05222222 , 0.5083 , 0.4404};
double A,x,w,O, rex[]={0,0,0,0,0,0,0,0,0};float xref=0,yref=0,xref2=0,yref2=0;
float prop,tamanox=0,tamanoy=0,e=200,mt=1;
int etapa=0, m1=60, k1=20, h1=260, l1=130,personaje=0,mundo=0,aprobar[]={0,0,0,0,0,0,0},lang=1,p=0,cuadrante,ayu=0; double r1;
PImage per[]=new PImage[10], Cuerdas[]=new PImage[3], fondo[]=new PImage[4], extra[]=new PImage[15], input[] = new PImage[2], mori,fongra,time,multime[] = new PImage[4];
PFont font; String planeta1[][]={{"Tierra","Marte","Luna","Mundo Libre"},{"Earth","Mars","Moon","Free World"}};
PImage help[] = new PImage [9];

void setup (){
  size(1000,700);
  fongra=loadImage("7.png");
  fongra.resize(454,229);//546, 4 : 546, 236 : 546, 468
  time=loadImage("time.png");multime[0]=loadImage("butont.png");multime[1]=loadImage("pos.png"); multime[2]=loadImage("vel.png"); multime[3]=loadImage("acel.png");
  input[0]=loadImage("input0.png");input[1]=loadImage("input1.png");
  mori=loadImage("deathm2.png");
  font = createFont("Kristen ITC",40); audio = new Minim(this);
  player[0] = audio.loadFile("Calm Piano Music (No Copyright).mp3"); player[1] = audio.loadFile("sound1.mp3"); player[2] = audio.loadFile("death1.mp3");player[3]=audio.loadFile("90's Video Game Music - Royalty-Free, Non-Copyright.mp3");
  fill(55);
  
   //fondo[mundo]=loadImage("10.png");// fondo[1]=loadImage("tittle3.png"); fondo[2]=loadImage("tittle4.png");// fondo[3]=loadImage("11.png"); fondo[4]=loadImage("12.png");
  
  for(int i=0;i<fondo.length;i++){
    fondo[i]=loadImage("fondos/f"+i+".png");
    fondo[i].resize(1000,700);
  }
  
  for(int i=0;i<per.length;i++){
    per[i]=loadImage("personajes/p"+(i+1)+".png");
  }
  for(int i=0; i<=8; i++){
    help[i]=loadImage("help"+i+".png");
  }
  
  extra[0]=loadImage("play0.png"); extra[1]=loadImage("play1.png"); extra[2]=loadImage("next1.png"); extra[3]=loadImage("back1.png");
  extra[4]=loadImage("sel1.png"); extra[5]=loadImage("sel2.png"); extra[6]=loadImage("tittle3.png"); extra[7]=loadImage("tittle4.png");
  extra[8]=loadImage("music1.png"); extra[9]=loadImage("music2.png"); extra[10]=loadImage("settings.png"); extra[11]=loadImage("help.png");
  extra[12]=loadImage("esp.png"); extra[13]=loadImage("ing.png");extra[14]=loadImage("bograf.png");
  
  background(fondo[mundo]);
  strokeWeight(2); line(570,0,570,185);
  //image(extra[7],110,0); image(per[0],450,170,120,120); image(extra[6],110,-230); image(extra[0],440,400,130,70);
  //no tengo idea de que cosas son las que se usan de este setup así que pos bueno
}

void draw (){  
  switch(etapa){
    case 4: //2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
        background(fondo[mundo]); textSize(40);
        if(mundo==0 | mundo==1){
          fill(49,0,149);
        }else if(mundo==3 | mundo==2){
          fill(186,38,6);
        }
        if(lang==0){
          text("¿Cuáles gráficas quieres ver\n     durante la simulación?",220,70); textSize(30);
          if(mundo==1 | mundo==3){
            fill(255);
          }else if(mundo==0){
            fill(255,147,42);
          }else if(mundo==2){
            fill(186,38,6);
          }
          text("Selec. todas",200,590);
        }else{
          text("Choose the graphs you want\nto observe during the simulation",200,70); textSize(30);
          if(mundo==1 | mundo==3){
            fill(255);
          }else if(mundo==0){
            fill(255,147,42);
          }else if(mundo==2){
            fill(186,38,6);
          }
          text("Select all",200,590);
        }
        text("X vs T",200,280); text("V vs T",200,330); text("A vs T",200,380); text("K",200,430); text("Ug",200,480); text("Us",200,530);
        if(!graf[0]){
          image(extra[4],350,260,40,30);
        }else image(extra[5],350,260,40,30);
        
        if(!graf[1]){
          image(extra[4],350,310,40,30);
        }else image(extra[5],350,310,40,30);
        
        if(!graf[2]){
          image(extra[4],350,360,40,30);
        }else image(extra[5],350,360,40,30);
        
        if(!graf[3]){
          image(extra[4],350,410,40,30);
        }else image(extra[5],350,410,40,30);
        
        if(!graf[4]){
          image(extra[4],350,460,40,30);
        }else image(extra[5],350,460,40,30);
        
        if(!graf[5]){
          image(extra[4],350,510,40,30);
        }else image(extra[5],350,510,40,30);
        
        if(!graf[0] | !graf[1] | !graf[2] | !graf[3] | !graf[4] | !graf[5]){
          image(extra[4],420,560,40,30);
        }else image(extra[5],420,560,40,30);
        
        image(extra[2],900,600,50,50); image(extra[3],50,50,50,50);
        
        if(!player[3].isPlaying() & mus){
          player[3].play();
        }
      break;
    case 5://222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
    copy(fondo[mundo],0,0,540,700,0,0,540,700); g1[3]=15;
      if(y<=l){
        caida_libre();
      }else{
        caida();
      }
      //ag=a/g;//estar atento a moverlo
      t=((mt*millis()-(sep)-sec)/1000);
      if(tg<75){
        tgant=tg;
        tg=t-p*75;
      }else{
        p++; tg=0;tgant=0;
        for(int u=0; u<3; u++){
          aprobar[u]=0;
        };
      }//println(anim);
      if((float)yant-(float)y<=0.1 & (float)yant-(float)y>=-0.1 ){
        if(anim){
          tmax=t;anim=false;
        }
      }else anim=true;//967,31
      imageMode(CENTER);image(extra[14],967,18,35,25);imageMode(CORNER);
      yant=y;
        vant=v;
        aant=a;
        
        if(!player[3].isPlaying() & mus){
          player[3].play();
        }
      break;
      case 2:
      background(fondo[0]); imageMode(CENTER); image(help[ayu],500,350);
      
      break;
    case 0://00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      //m1=60; k1=10; h1=410; l1=170; r1=1;
      sep=0; mt=1; player[3].pause(); g1[3]=15;
      background(fondo[0]);
      strokeWeight(2); line(470,0,470,185+(float)yb);
      image(extra[7],110,0); image(per[0],450,170+(float)yb,120,120); image(extra[6],110,-230); imageMode(CENTER); textSize(15); fill(49,0,109);
      image(extra[0],500,400,230,70);
      image(extra[0],500,500,230,70);
      if(lang==0){
        text("               Fase 1:\ncon resistencia del aire",400,390); text("              Fase 2:\nsin resistencia del aire",405,490);
      }else{
        text("               Phase 1:\n air resistance included",400,390); text("              Phase 2:\n       no air resistance",405,490);
      }imageMode(CORNER);
      
      image(extra[10],20,20,50,40); image(extra[11],20,90,50,40);
      if(set){
        if(mus){
          image(extra[8],90,20,50,40); player[0].play();
        }else{
          image(extra[9],90,20,50,40); player[0].pause();
        }
        if(lang==0){
          image(extra[12],160,20,50,40);
        }else if(lang==1){
          image(extra[13],160,20,50,40);
        }
      }
      if(bajar){
        tb+=0.3; yb=g*tb*tb/3;
        strokeWeight(2); //line(470,0,470,185+(float)yb);
        image(per[0],450,170+(float)yb,120,120); //image(extra[4],110,-230);
      }
      if(yb>700){
        player[0].pause(); etapa=3;
      }else{
        if(mus){
          player[0].play();
        }else{
          player[0].pause();
        }
      }
      break;
    case 3://11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
      background(fondo[mundo]);
      if(caso) image(input[0],0,0); else image(input[1],0,0);
      image(extra[2],907,600,50,50); image(extra[3],50,50,50,50);
      textFont(font); textSize(30); fill(255,147,42);
      if(lang==0){
        text("Masa",180,193); text("Longitud de cuerda",90,290); text("Elasticidad",140,395); text("Altura",170,490); text("Resistencia del aire",80,613);
        text("Personaje",640,210);
        fill(49,0,149); text("Mundo",430,60); textSize(20); text("g: "+(float)g1[mundo],560,62);
      }else{
        text("Mass",190,193); text("Rope length",140,290); text("Elasticity",150,395); text("Heigh",180,490); text("Air resistance",130,613);
        text("Jumper",650,210);
        fill(49,0,149); text("World",440,60); textSize(20);text("g: "+(float)g1[mundo],560,62);
      }textSize(40); fill(255);
      text(String.valueOf(m1),200,243);
      text(String.valueOf(l1),200,340);
      text(String.valueOf(k1),200,445);
      text(String.valueOf(h1),190,540);
      text(String.valueOf(r1),200,663);
      textAlign(CENTER,CENTER);text(planeta1[lang][mundo],485,91);textAlign(BASELINE);
      
      imageMode(CENTER);image(per[personaje],725,440,335,321);imageMode(CORNER);
      for(int u=0; u<6; u++){
        graf[u]=false; aprobar[u]=0; todasxd=false; aprobar[6]=0;
      }
      
      if(!player[3].isPlaying() & mus){
          player[3].play();
        }
      break;
    case 6:
      background(0);
      y=rex[4]; t=0; t1=rex[2]; t2=rex[3]; tb=0; yb=0; vo1=rex[8]; v=0; A=rex[6]; yf=0; set=false;etapa=6;a=0;xo1=rex[7];O=rex[5];
      //println(tmax);
      println("c"+y);
      if(!zoom[1]){
        image(fongra,2,4,998,229);
        image(fongra,2,236,998,229);
        image(fongra,2,468,998,229);
      }else{
        image(fongra,0,0,1000,700);
      }
      while(t<=(rex[1]-rex[0])){
        if(y<=l){
          caida_libre();
        }else{
          caida();
        }
        stroke(0);
        if(!zoom[1]){
          point((float)(t*990/(rex[1]-rex[0]))+4,(float)y*188/h1+30);
          point((float)(t*990/(rex[1]-rex[0]))+4,(float)v*188/h1+312);
          point((float)(t*990/(rex[1]-rex[0]))+4,(float)a*2+569);
        }else{
          switch(cuadrante){
            case 1:
              point((float)(t*990/(rex[1]-rex[0]))+4,(float)y*(665)/h1+25);
              break;
            case 2:
              point((float)(t*990/(rex[1]-rex[0]))+4,(float)(v*340/Math.sqrt(2*l*g))+350);
              break;
            case 3:
              point((float)(t*990/(rex[1]-rex[0]))+4,(float)(a*340/(g/2*(4*g*l*l+x)-5))+350);
              break;
          }
        }
        t+=((rex[1]-rex[0])/990);
      }
      strokeWeight(0.8);fill(0);
      textSize(20);
      line(4,312,998,312);
      line(4,569,998,569);
      if(!zoom[1]){
        stroke(#FF3B3B);
        line(4,(float)l*188/h1+30,998,(float)l*188/h1+30);
        line(4,(float)(l+x)*188/h1+30,998,(float)(l+x)*188/h1+30);
        fill(0);
        stroke(0);
        line(0,mouseY,1000,mouseY);line(mouseX,0,mouseX,700);
        if(mouseY<=233) text("T:"+(float)((mouseX-4)*(rex[1]-rex[0])/990+rex[0])+", Y:"+(float)(h-(mouseY-30)*h/188),(mouseX+7),(mouseY-7));
        if(mouseY<=465 & mouseY>233) text("T:"+(float)((mouseX-4)*(rex[1]-rex[0])/990+rex[0])+", V:"+(-(mouseY-312)*h/188),(mouseX+7),(mouseY-7));
        if(mouseY<=697 & mouseY>465) text("T:"+(float)((mouseX-4)*(rex[1]-rex[0])/990+rex[0])+", A:"+(-(mouseY-569)/2),(mouseX+7),(mouseY-7));
      }else{
        switch(cuadrante){
          case 1:
            text("T:"+(float)((mouseX-4)*(rex[1]-rex[0])/990+rex[0])+", Y:"+(float)(h-(mouseY-25)*h/665),(mouseX+7),(mouseY-7));
            break;
          case 2:
            text("T:"+(float)((mouseX-4)*(rex[1]-rex[0])/990+rex[0])+", V:"+(-(mouseY-350)*Math.sqrt(2*l*g)/340),(mouseX+7),(mouseY-7));
            break;
          case 3:
            text("T:"+(float)((mouseX-4)*(rex[1]-rex[0])/990+rex[0])+", A:"+(-(mouseY-350)*(g/2*(4*g*l*l+x)-5)/340),(mouseX+7),(mouseY-7));
            break;
        }
      }
      strokeWeight(3);stroke(0);
      zoom();
  }
  fill(255); textSize(10); //text(mouseX+", "+mouseY,mouseX,mouseY);
}


void dibujo(){
  //println((pcuerd[0])+","+personaje);
  if(etapa==5){
  if(y+12<=h){
    image(extra[3],50,50,50,50);
    strokeWeight(0.1*prop);
    if(y<=l){
      line((float)(e-6+pcuerd[personaje]*tamanox),0,(float)(e-6+pcuerd[personaje]*tamanox),(float)((y+(l-y)/2)*prop));
    }else{
      line((float)(e-6+pcuerd[personaje]*tamanox),0,(float)(e-6+pcuerd[personaje]*tamanox),(float)yf+10);
    }graficas();
    imageMode(CORNER);image(per[personaje],(float)e-6,(float)yf,tamanox,tamanoy);
    
    if(t<10){
      textSize(30);
    }else if(t>=10 & t<100){
      textSize(25);
    }else if(t>=100 & t<1000){
      textSize(20);
    }else{
      textSize(15);
    }
    image(time,253,4,160,50); text((float)t+"s",315,41);
    image(multime[0],253,78,163,58); image(multime[1],420,4,100,40); image(multime[2],420,54,100,40); image(multime[3],420,104,100,40);
    textSize(20); text((float)y,440,30); text((float)v,440,80); text((float)a,440,130);
    textSize(18);text("X"+mt,269,118);
    
    t2=((mt*millis()-(sep)-sec2)/1000);
    t1=((mt*millis()-(sep)-sec1)/1000);//((millis()-sec1)/1000);
  }else{
    image(mori,0,0);
    player[2].play();
    //println(y);
    player[3].rewind();player[3].rewind();
    //delay(500);
  }
  }else{
      t2+=(rex[1]-rex[0])/990;
      t1+=(rex[1]-rex[0])/990;
    }
}

void caida(){
  t1=0;
  //println("t2: "+t2);
  if(caso){
    y=l+x+A*Math.pow(Math.E,(-1*r*t2/(2*m)))*Math.cos(w*t2-O);
    v=-A*Math.pow(Math.E,(-1*r*t2/(2*m)))*(r/2/m + Math.sin(w*t2-O)*w);
    a=(m*g - r*v - k*(y-l) )/m;
  }else{
    y=l+x+A*Math.cos(w*t2-O);
    v=-A*Math.sin(w*t2-O)*w;
    a=(m*g - k*(y-l) )/m;
  }
  //a=(m*g - r*v - k*(y-l) )/m;
  //println("b"+y);
  if(y>=l){
    vo1=v;
    yf=y*prop;
    dibujo();
    t1=0;
    sec1=sec+t*1000;
  }else{
    xo1=l;
    caida_libre();
  }
}

void caida_libre(){
  t2=0.001;
  //println("mi: "+millis()+" t: "+(sec1+t*1000));
  sec2=sec+t*1000-1;
  //println("a");
  b=-g*t1/vf;
  if(caso){
    v=vf-Math.pow(Math.E,b)*(vf-vo1);
    y=vf*(t1+(vf-vo1)*(Math.pow(Math.E,b)-1)/g)+xo1;
  }else{
    y=xo1+vo1*t1+g*t1*t1/2;
    v=vo1+g*t1;
  }
  a=g-r*v/m;
  if(y<=l){ 
    //xo2=y;
    A=Math.sqrt(m*v*v/k+x*x);
    O=Math.acos(-x/A);//println("O "+O+" x "+x);
    //println(A+" v "+v);
    yf=y*prop;
    dibujo();
    sec2=sec+t*1000-1;
    t2=0.001;
  }else{
    caida();
  }
}

void mouseClicked(){
  //println(mouseX+","+mouseY+" y:"+y);
  if(mouseButton==RIGHT){
    println("y: "+mouseY);
  }else println("x: "+mouseX);
  switch(etapa){
    case 0://00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      if(mouseY>20 & mouseY<60){
        if(mouseX>20 & mouseX<70){
          set=!set;
        }
      }if(set){
        if(mouseY>20 & mouseY<60){
          if(mouseX>90 & mouseX<140){
            mus=!mus;
          }
          if(mouseX>160 & mouseX<210){
            if(lang==1){
              lang=0;
            }else if(lang==0){
              lang=1;
            }
          }
        }
      }
      if(!helpB & mouseX>20 & mouseX<70 & mouseY>90 & mouseY<130){
        helpB=true; etapa=2;
      }
      if(mouseX>384 & mouseX<613){
        if(mouseY>=365 & mouseY<=434){//388,475 - 630,542
          bajar=true;player[1].play(); caso=true; r1=1;
        }
        if(mouseY>=465 & mouseY<=534){//401,387 - 621,454
          bajar=true;player[1].play(); caso=false; r1=0;
        }
      }
      case 2:
        if(mouseX>869 & mouseX<943 & mouseY>31 & mouseY<102){
          etapa=0; ayu=0; helpB=false;
        }
      break;
    case 3://11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
      //x1
      if(mouseX>50 & mouseX<100 & mouseY>50 & mouseY<100){//********************************************REGRESOOO
        player[1].play(); etapa=0; yb=0; tb=0; bajar=false; set=false;
      }
      if(mouseX>=64 & mouseX<=113){//*****************************MENOS UNO**************************************************
        if(mouseY>=203 & mouseY<=248 & m1>9){
          m1--;
          println(m1);
        }
        if(mouseY>=300 & mouseY<=345 & l1>20){
          l1--;
        }
        if(mouseY>=406 & mouseY<=451 & k1>2){
          k1--;
          if(k1<=r1){
            r1=k1-0.5;
          }
        }
        if(mouseY>=503 & mouseY<=548 & h1>25){
          h1--;
        }
        if(mouseY>=622 & mouseY<=667 & r1>0.5 & caso){
          r1-=0.5;
        }
      }else if(mouseX>=326 & mouseX<=374){//***************************MÁS UNO ****************************************************
        if(mouseY>=203 & mouseY<=248){
          m1++;
        }
        if(mouseY>=300 & mouseY<=345 & l1<h1+5){
          l1++;
        }
        if(mouseY>=406 & mouseY<=451){
          k1++;
        }
        if(mouseY>=503 & mouseY<=548){
          h1++;
        }
        if(mouseY>=622 & mouseY<=667 & r1<k1-0.5 & caso){
          r1+=0.5;
        }
      }else if(mouseX>=9 & mouseX<=57){//**************************MENOS DIEZ*****************************************
        if(mouseY>=203 & mouseY<=248 & m1>10){
          m1-=10;
          println(m1);
        }
        if(mouseY>=300 & mouseY<=345 & l1>20){
          l1-=10;
        }
        if(mouseY>=406 & mouseY<=451 & k1>12){
          k1-=10;
          if(k1<=r1){
            r1=k1-0.5;
          }
        }
        if(mouseY>=503 & mouseY<=548 & h1>25){
          h1-=10;
        }
        if(mouseY>=622 & mouseY<=667 & r1>1 & caso){
          r1-=1;
        }
      }else if(mouseX>=382 & mouseX<=430){//**********************************MÁS DIEZ***********************************************
        if(mouseY>=203 & mouseY<=248){
          m1+=10;
        }
        if(mouseY>=300 & mouseY<=345 & l1<h1+5){
          l1+=10;
        }
        if(mouseY>=406 & mouseY<=451){
          k1+=10;
        }
        if(mouseY>=503 & mouseY<=548){
          h1+=10;
        }
        if(mouseY>=622 & mouseY<=667 & r1<k1-1 & caso){
          r1+=1;
        }
      }
      /*if(mouseX>50 & mouseX<100 & mouseY>50 & mouseY<100){
        player[1].play(); etapa=0; yb=0; tb=0; bajar=false;
      }*/
      if(mouseX>=900 & mouseX<=948 & mouseY<=650 & mouseY>=599){//********************AVANZO**********************
        etapa=4;
        m=m1; l=l1; k=k1; h=h1; r=r1;
        g=g1[mundo];
        x=m*g/k;
        vf=m*g/r;
        prop=698/(float)h;
        w=Math.sqrt(k/m);
        tamanox=8*prop; 
        tamanoy=12*prop;
        sec=millis();sec1=millis();sec2=millis();//cambio
      }
      if(mouseX>=456 & mouseX<=506 & mouseY>=417 & mouseY<=462){//456,417,506,462
        if(personaje>0){
          personaje--;
        }else personaje=per.length-1;
      }
      if(mouseX>=914 & mouseX<=966 & mouseY>=416 & mouseY<=462){//914,416,966,462
        if(personaje<per.length-1){
          personaje++;
        }else personaje=0;
      }
      if(mouseX>=304 & mouseX<=339 & mouseY>=83 & mouseY<=114){//304,83,339,114
        if(mundo>0){
          mundo--;
        }else mundo=fondo.length-1;
      }
      if(mouseX>=633 & mouseX<=668 & mouseY>=83 & mouseY<=114){//633,83,668,114
        if(mundo<fondo.length-1){
          mundo++;
        }else mundo=0;
      }
      break;
      case 4://222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
        if(mouseX>50 & mouseX<100 & mouseY>50 & mouseY<100){
          etapa=3; bajar=false; y=0; xo1=0; t=0; t1=0; t2=0; yb=0; tb=0; vo1=0; v=0; A=0; yf=0; O=0; vf=0; player[2] = audio.loadFile("death1.mp3"); tg=0; p=0;
        }
        if(mouseX>=900 & mouseX<=948 & mouseY<=650 & mouseY>=599){
          etapa=5;
          sec=millis();sec1=millis();sec2=millis();
        }
        if(mouseX>351 & mouseX<387){
          if(mouseY>260 & mouseY<287){
            graf[0]=!graf[0];
          }
          if(mouseY>310 & mouseY<337){
            graf[1]=!graf[1];
          }
          if(mouseY>360 & mouseY<387){
            graf[2]=!graf[2];
          }
          if(mouseY>410 & mouseY<437){
            graf[3]=!graf[3];
          }
          if(mouseY>460 & mouseY<487){
            graf[4]=!graf[4];
          }
          if(mouseY>510 & mouseY<537){
            graf[5]=!graf[5];
          }
        }else if(mouseX>421 & mouseX<458 & mouseY>560 & mouseY<589){
         if(!todasxd){
           graf[0]=true; graf[1]=true; graf[2]=true; graf[3]=true; graf[4]=true; graf[5]=true; todasxd=true;
         }else{
           graf[0]=false; graf[1]=false; graf[2]=false; graf[3]=false; graf[4]=false; graf[5]=false; todasxd=false;
         }
        }
      break;
    case 5://3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
      if(y+12<=h){
        if (mouseX>50 & mouseX<100 & mouseY>50 & mouseY<100){
          etapa=3; bajar=false; y=0; xo1=0; t=0; t1=0; t2=0; yb=0; tb=0; vo1=0; v=0; A=0; yf=0; O=0; vf=0; player[2] = audio.loadFile("death1.mp3");mt=1;sep=0; tg=0; p=0;
          tgant=0;aant=0;vant=0;yant=0;
        }
        if(mouseX>=370 & mouseX<=407 & mouseY>=87 & mouseY<=101 & mt<7){
          mt+=1;
          sep+=millis();
        }
        if(mouseX>=370 & mouseX<=407 & mouseY>=109 & mouseY<126 & mt>=1){
          mt-=1;sep-=millis();
        }
      }else if(y+12>h){
        if (mouseX>196 & mouseX<821 & mouseY>441 & mouseY<496){
          etapa=0; player[1].play(); yb=0; tb=0; bajar=false; y=0; t=0; t1=0; t2=0; tb=0; yb=0; vo1=0; v=0; A=0; yf=0; O=0; vf=0; set=false;
          tgant=0;aant=0;vant=0;yant=0;
          player[2] = audio.loadFile("death1.mp3"); tg=0; p=0; set=false;
        }
      }//949,6-984,30
      if(mouseX>949 & mouseX<984 & mouseY>8 & mouseY<32){
        if(y+12<=h & anim) tmax=t;
        anim=false;background(fondo[mundo]);
        image(fongra,2,4,998,229);
        image(fongra,2,236,998,229);
        image(fongra,2,468,998,229);
        y=0; t=0; t1=0; t2=0; tb=0; yb=0; vo1=0; v=0; A=0; yf=0; set=false;etapa=6;y=0;a=0;xo1=0;rex[1]=tmax;
        println(tmax);
        /*while(t<=tmax){
          if(y<=l){
            caida_libre();
          }else{
            caida();
          }
          point((float)(t*990/tmax)+4,(float)y*188/h1+30);
          t+=(tmax/990);
          //println(y);
        }*/
      }
      break;
    case 6:
      if(mouseButton==RIGHT){
        zoom[0]=false;zoom[1]=false;rex[0]=0;rex[2]=0;rex[3]=0;rex[4]=0;rex[1]=tmax;rex[7]=0;rex[8]=0;
      }
  }
  //delay(10);
}

void graficas(){//546, 4 : 546, 236 : 546, 468
  strokeWeight(3);
  rectMode(CORNERS);
  if(graf[3] | graf[4] | graf[5]){
    image(fongra,308,197,230,500); line(318,660,528,660);
  }
  if(graf[3] & !graf[4] & !graf[5]){
    fill(255,78,40); text("K",423,678); rect(338,(float)(661-(m*v*v/2)*462/(m*g*h)),508,659);
  }else if(!graf[3] & graf[4] & !graf[5]){
    fill(40,255,89); text("Ug",423,678); rect(338,(float)(661-(m*g*(h-y))*462/(m*g*h)),508,659);//198 => 660-198=462 // 700-198=
  }else if(!graf[3] & !graf[4] & graf[5]){
    fill(43,168,255); text("Us",423,678); 
    if(y>=l){
      rect(338,(float)(661-(k/2*(y-l)*(y-l))*462/(m*g*h)),508,659);
    }
  }else if(graf[3] & graf[4] & !graf[5]){
    fill(255,78,40); text("K",378,678); rect(338,(float)(661-(m*v*v/2)*462/(m*g*h)),418,659);
    fill(40,255,89); text("Ug",468,678); rect(428,(float)(661-(m*g*(h-y))*462/(m*g*h)),508,659);
  }else if(graf[3] & !graf[4] & graf[5]){
    fill(255,78,40); text("K",378,678); rect(338,(float)(661-(m*v*v/2)*462/(m*g*h)),418,659);
    fill(43,168,255); text("Us",468,678); 
    if(y>=l){
      rect(428,(float)(661-(k/2*(y-l)*(y-l))*462/(m*g*h)),508,659);
    }
  }else if(!graf[3] & graf[4] & graf[5]){
    fill(40,255,89); text("Ug",378,678); rect(338,(float)(661-(m*g*(h-y))*462/(m*g*h)),418,659);
    fill(43,168,255); text("Us",468,678);
    if(y>=l){
      rect(428,(float)(661-(k/2*(y-l)*(y-l))*462/(m*g*h)),508,659);
    }
  }else if(graf[3] & graf[4] & graf[5]){
    fill(255,78,40); text("K",363,678); rect(338,(float)(661-(m*v*v/2)*462/(m*g*h)),388,659);
    fill(40,255,89); text("Ug",423,678); rect(398,(float)(661-(m*g*(h-y))*462/(m*g*h)),448,659);
    fill(43,168,255); text("Us",483,678);
    if(y>=l){
      rect(458,(float)(661-(k/2*(y-l)*(y-l))*462/(m*g*h)),508,659);
    }
  }
  if(aprobar[6]==0){
    copy(fondo[mundo],540,0,460,700,540,0,460,700); aprobar[6]++;
  }fill(0);
  
  if(graf[0]){
    if(aprobar[0]==0){//188
      image(fongra,546,4); aprobar[0]++; line(557,17,557,217); line(557,217,970,217); text("x(m)",557,14); text("t(s)",980,217);
    }
    strokeWeight(0.5);line(557,30,1000,30);line(557,(float)l*188/h1+30,1000,(float)l1*188/h1+30);/*line(557,(float)(x+l)*188/h1,1000,(float)(x+l1)*188/h1)*/;strokeWeight(3);
    textAlign(CENTER,CENTER);text("0",551,30);text("l",551,(float)l1*0.88+30);textAlign(BASELINE);
    //point((float)tg*5+567,(float)y*188/h1+30);
    line((float)tgant*5+567,(float)yant*188/h1+30,(float)tg*5+567,(float)y*188/h1+30);
  }
  if(graf[1]){
    if(aprobar[1]==0){
      image(fongra,546,236); aprobar[1]++; line(557,249,557,449); line(557,449,970,449); text("v(m/s)",557,246); text("t(s)",980,449);
    }
    strokeWeight(0.5);line(557,312,1000,312);strokeWeight(3);textAlign(CENTER,CENTER);text("0",551,312);textAlign(BASELINE);
    //point((float)tg*5+567,(float)v*188/h1+312);
    line((float)tgant*5+567,(float)vant*188/h1+312,(float)tg*5+567,(float)v*188/h1+312);
  }
  if(graf[2]){
    if(aprobar[2]==0){
      image(fongra,546,468); aprobar[2]++; line(557,481,557,681); line(557,681,970,681); text("a(m/s^2)",557,478); text("t(s)",980,681);
    }
    strokeWeight(0.5);line(557,569,1000,569);strokeWeight(3);textAlign(CENTER,CENTER);text("0",551,569);textAlign(BASELINE);
    //point((float)tg*5+567,(float)a*2+569);
    line((float)tgant*5+567,(float)aant*2+569,(float)tg*5+567,(float)a*2+569);
  }
}

void keyPressed(){
  if(etapa==3 & mundo==3 & key==CODED){
    if(keyCode==UP & g1[3]<30){
      g1[3]+=0.2;
    }else if(keyCode==DOWN & g1[3]>1){
      g1[3]-=0.2;
    }
  }
  if(etapa==2 & key == CODED){
    if(keyCode==LEFT){
      if(ayu>0){
        ayu--;
      }
    }else if(keyCode==RIGHT){
      if(ayu<8){
        ayu++;
      }
    }
  }
  if(key=='r' || key=='R'){
    etapa=0; bajar=false; y=0; xo1=0; t=0; t1=0; t2=0; yb=0; tb=0; vo1=0; v=0; A=0; yf=0; O=0; vf=0; player[2] = audio.loadFile("death1.mp3");mt=1;sep=0; tg=0; p=0;
    tgant=0;aant=0;vant=0;yant=0;anim=true;
    for(int i=0; i<player.length;i++){
      player[i].rewind();
    }
  }
  
}

void mouseDragged(){
  if(etapa==6 & !zoom[1]){
    int cuadra=0;
    if(mouseY<=233) cuadra=1;
    if(mouseY<=465 & mouseY>233) cuadra=2;
    if(mouseY<=697 & mouseY>465) cuadra=3;
    
    xref2=mouseX;
    if(cuadrante==cuadra){
      zoom[0]=true;
      yref2=mouseY;
    }
  }
}
void mousePressed(){
  if(mouseButton==LEFT & !zoom[1] & etapa==6){ 
    xref=mouseX;
    yref=mouseY;
    if(mouseY<=233) cuadrante=1;
    if(mouseY<=465 & mouseY>233) cuadrante=2;
    if(mouseY<=697 & mouseY>465) cuadrante=3;
  }
}
void mouseReleased(){
  if(etapa==6 & zoom[0] & !zoom[1]){
    zoom[1]=true;
    zoom[0]=false;
    t=0; t1=rex[2]; t2=rex[3]; tb=0; yb=0; vo1=rex[8]; v=0; A=0; yf=0; set=false;etapa=6;y=0;a=0;xo1=rex[7];
    double in=((xref-4)*tmax/990),fin=((xref2-4)*tmax/990),aux;
    if(in>fin){
      aux=in;
      in=fin;
      fin=aux;
    }
    while(t<=in){
          if(y<=l){
            caida_libre();
          }else{
            caida();
          }
          /*point((float)(t*990/tmax)+4,(float)y*188/h1+30);
          point((float)(t*990/tmax)+4,(float)v*188/h1+312);
          point((float)(t*990/tmax)+4,(float)a*2+569);*/
          t+=(tmax/990);
          //println(y);
    }
    rex[0]=in;
    rex[1]=fin;
    rex[2]=t1;
    rex[3]=t2;
    rex[4]=y;
    rex[5]=O;
    rex[6]=A;
    rex[7]=xo1;
    rex[8]=vo1;
    println("t"+rex[4]);
  }
}

void zoom(){
  if(etapa==6 & zoom[0]){
    stroke(1);noFill();
    rect(xref,yref,xref2,yref2);
    stroke(3);
  }
}
