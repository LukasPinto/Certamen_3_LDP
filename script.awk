#!/bin/awk
BEGIN{
  FS=","
  print ":- discontiguous persona/1."
  print ":- discontiguous progenitor/2."
}
  {
  
  print "persona(\""$1"\")."
  if ($7 && $7 !=""){

      print "progenitor(\""$7"\",""\""$1"\")."
  }
  if ($8 && $8 !=""){

      print "progenitor(\""$8"\",""\""$1"\")."
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
