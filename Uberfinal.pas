// Nombre: Fernández Ian Santiago. ISI: "C" . Legajo: 24057
Program UberFinal;
uses crt;
VAR

Secuber: File of char;  //Secuencia de entrada
SecSal: File of char;   //Secuencia de salida
v: Char;
aux:integer;  //Permite convertir el valor de la variable V en entero.
prom:Longint;
acum,i: integer; // Acumulador, i para bucle for
contv : Longint; //Contador viajes
contv9: Longint;  // Contador viajes en los dias 1-2-3-4-5-6-7-8-9
bandera: boolean; //Se escribe o no
porc: real;  // Porcentaje


BEGIN 
      assign(Secuber, 'SecuenciaE.txt');
  {$I-}
  reset(Secuber);
  {$I+}
  if IOResult <> 0 then
    halt(2);
  assign(SecSal, 'SecuenciaS.txt');
  rewrite(SecSal);

  read(Secuber, v);
  contv:=0; contv9:=0; bandera:=false; aux:=0; acum:=0; porc:=0; prom:=0;
  
 
     While (not eof (Secuber) and (v <> '*') ) do 
        Begin
        contv:=contv+1;      // Cuando cumpla la condicion cuenta un viaje
           
          If ( v = 'C' ) then  
           begin 
             read(Secuber, v);
             
              If ( v = 'M' ) then
                begin 
                  
                   read(Secuber, v);
                   
                    If ( v = 'S' ) then    //Si llega hasta aca, es que cumple con la condcion
                     begin                 // de 'CMS'
                     
                       Write(SecSal, 'C');
                       write (SecSal, 'M');
                       bandera:= true;     //Verde para escribir
                       
                    For i:= 1 to 12 do
                      begin
                       write(SecSal, v);
                       read(Secuber, v);
                      end;
                      end
                      
                 else                     // A partir de aqui los sino
                                         // si no se cumple 'CMS'
                    For i:=1 to 12 do
                      begin
                        read(Secuber, v);
                       end;
                    end
                    
              else
                 
                   For i:= 1 to 13 do
                     begin 
                       read(Secuber, v);
                         end;
                    end
                    
          else
                  
               For i:= 1 to 14 do
                 begin
                   read(Secuber, v);
                     end;
                        
                 
        If (v = '0') then    // Si son los dias de 1 - 9 de los meses
         begin
          contv9:=contv9+1;
          end;
  
            if (bandera) then   // Si es bandera = verde escribe
             begin 
              for i:= 1 to 10 do
                Begin 
                 write(Secsal, v);
                 read(Secuber, v);
                  end;   
             end
             
           else
           
              for i:= 1 to 10 do // Sino solo avanza
                Begin 
                read(Secuber, v);
                 end;
          
         
  For i:= 1 to 4 do     // Tratamiento del recorrido
             begin
              
   Case v of         //Conversion de caracter a entero
 '0': Begin
      aux:= 0;
       end;
 '1': Begin
      aux:= 1;
       end;
 '2': Begin
      aux:= 2;
       end;
 '3': Begin
      aux:= 3;
       end;
 '4': Begin
      aux:= 4;
       end;
 '5': Begin
      aux:= 5;
       end;
 '6': Begin
      aux:= 6;
       end;
 '7': Begin
      aux:= 7;
       end;
 '8': Begin
      aux:= 8;
      end;
 '9': Begin
      aux:= 9;
      end;
 end;
Case i of         //Conversion a un numero de 4 digitos

1: Begin
     aux:=aux*1000;
       end;

2: Begin
     aux:=aux*100;
       end;
3: Begin
     aux:=aux*10;
       end;
4: Begin
     aux:=aux*1;
       end;
end;
Acum:=Acum+aux;    //Acumulador del recorrido
   
   if (Bandera) then       
    begin 
      write(SecSal, v);
     end;
     read(Secuber, v);
         end;
      
      
 If (Bandera) then  //Tratamiento del resto de la secuencia
   Begin
     While (Not eof (Secuber) and (v<> '+')) do
       begin
         write(SecSal, v);
         read(Secuber, v);
         end;
         write(SecSal, '+');
        end
       else
         While (Not eof (Secuber) and (v<> '+')) do
          begin
           read(Secuber, v);
           end;
     bandera:= false;  //Reseteo la bandera
     
     If(Not eof (Secuber)) then
      begin 
      read(Secuber, v);
      end;
     
                  
     end;                                          
     
      // Parte del calculo
      porc:=(contv9/contv)*100;
      prom:=(acum div contv);
 gotoxy(1,9); 
 writeln('--------------------------------------------------------------------------------');          
                                                                                                   
                               gotoxy(30,10); Writeln('DATOS RESULTANTES');                                                                                                                                       
 write('|');                                                                                                                                          
 gotoxy(1,12);                                                                                                                                  
 write('|');                                                                                                                                     
 gotoxy(1,13); gotoxy(5,12);Writeln('> Cantidad de vajes realizados los primeros 9 dias: ',contv9);                                               
 write('|');                                                                                                                                     
 gotoxy(1,14);                                                                                                                                   
 write('|');                                                                                                                                     
 gotoxy(1,15); gotoxy(5,14);Writeln('> Con un porcentaje de: ', porc:0:2,'%'); gotoxy(40,14);  Writeln(' > Sobre un total de: ', contv);        
 write('|');                                                                                                                                     
 gotoxy(1,16);                                                                                                                                   
 write('|');                                                                                                                                     
 gotoxy(1,17); gotoxy(5,17);Writeln('> Promedio de la distancia recorrida sobre la cantidad de viajes: ', prom);                                
 write('|');                                                                                                                                     
 gotoxy(1,18);                                                                                                                                    
 write('|');                                                                                                                                    
 gotoxy(1,19);                                                                                                                                  
 write('|');                                                                                                                                     
 gotoxy(1,20);                                                                                                                                  
 write('|');                                                                                                                                    
 gotoxy(1,21);                                                                                                                                  
 writeln('--------------------------------------------------------------------------------');                                                         
      
      Close(Secuber); Close(SecSal);
      Readkey;   
END.
