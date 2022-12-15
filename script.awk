#!/bin/awk
BEGIN{
  FS=","
}
  {
if($1 != "nombre y apellido"){
  
  print "persona(\""$1"\")."
  if ($7){

      print "progenitor(\""$7"\")."
  }
  if ($8){
      print "progenitor(\""$8"\")."

  }

}


    }
  END{
    print "padre(X,Y):-progenitor(X,Y),persona(X)."
    print "hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y),not(X==Y)."
    print "abuelo(X,Y):-progenitor(Z,Y),progenitor(X,Z)."
    print "bisabuelo(X,Y):-progenitor(Z,Y),abuelo(X,Z)."
    print "tatarabuelo(X,Y):-progenitor(Z,Y),bisabuelo(X,Z)."
    print "antecesor_de(X,Y):-progenitor(X,Y),persona(X),persona(Y)."
    print "antecesor_de(X,Y):-progenitor(X,Z),antecesor_de(Z,Y)."
    print "tio(X,Y):-progenitor(Z,Y),hermanos(Z,X)."
    print "primo(X,Y):-progenitor(Z,Y), tio(Z,X)."
    print "sobrino(X,Y):-progenitor(Z,Y),hermanos(Z,X)."
      }
