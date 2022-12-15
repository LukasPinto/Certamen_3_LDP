persona('Victor Bouvier').
persona('Florette DuChamps').
persona('Victor Bouvier Jr.').
persona('Gabrielle Gateau').
persona('Honoré Bouvier').
persona('Didi Bouvier').
persona('Marie Trousseau').
persona('Cléo Bouvier').
persona('Théo Bouvier').
persona('Fr. René Bouvier').
persona('Marcel Bouvier').
persona('Angelique Marceau').
persona('Lance Bouvier').
persona('Alfred Bouvier').
persona('Erique Bouvier').
persona('Georgette Bouvier').
persona('Babette Bouvier').
persona('Etienne Bouvier').
persona('Charlemagne Bouvier').
persona('Jacques Bouvier').
persona('Françoise Billout').
persona('Coquette Bouvier').
persona('Fifi Bouvier').
persona('Lalique Bouvier').
persona('Monique Bouvier').
persona('Pépé Bouvier').
persona('Bambi Petitbois').
persona('Chester Bouvier').
persona('Jonah Jo-jo Bouvier').
persona('Clancy Bouvier').
persona('Jacqueline Ingrid Gurney').
persona('Selma Bouvier').
persona('Patricia Bouvier').
persona('Marjorie J. Bouvier').
persona('Homer Jay Simpson').
persona('Ling Bouvier').
persona('Margaret Simpson').
persona('Lisa Marie Simpson').
persona('Bartholomew Jo-jo Simpson').
progenitor('Victor Bouvier').
progenitor('Gabrielle Gateau').
progenitor('Victor Bouvier Jr.').
progenitor('Gabrielle Gateau').
progenitor('Victor Bouvier Jr.').
progenitor('Gabrielle Gateau').
progenitor('Victor Bouvier Jr.').
progenitor('Gabrielle Gateau').
progenitor('Marie Trousseau').
progenitor('Marie Trousseau').
progenitor('Marie Trousseau').
progenitor('Marie Trousseau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Marcel Bouvier').
progenitor('Angelique Marceau').
progenitor('Jacques Bouvier').
progenitor('Françoise Billout').
progenitor('Jacques Bouvier').
progenitor('Françoise Billout').
progenitor('Jacques Bouvier').
progenitor('Françoise Billout').
progenitor('Jacques Bouvier').
progenitor('Françoise Billout').
progenitor('Jacques Bouvier').
progenitor('Françoise Billout').
progenitor('Pépé Bouvier').
progenitor('Bambi Petitbois').
progenitor('Pépé Bouvier').
progenitor('Bambi Petitbois').
progenitor('Pépé Bouvier').
progenitor('Bambi Petitbois').
progenitor('Clancy Bouvier').
progenitor('Jacqueline Ingrid Gurney').
progenitor('Clancy Bouvier').
progenitor('Jacqueline Ingrid Gurney').
progenitor('Clancy Bouvier').
progenitor('Jacqueline Ingrid Gurney').
progenitor('Selma Bouvier').
progenitor('Homer Jay Simpson').
progenitor('Marjorie J. Bouvier').
progenitor('Homer Jay Simpson').
progenitor('Marjorie J. Bouvier').
progenitor('Homer Jay Simpson').
progenitor('Marjorie J. Bouvier').
padre(X,Y):-progenitor(X,Y),persona(X).
hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y),not(X==Y).
abuelo(X,Y):-progenitor(Z,Y),progenitor(X,Z).
bisabuelo(X,Y):-progenitor(Z,Y),abuelo(X,Z).
tatarabuelo(X,Y):-progenitor(Z,Y),bisabuelo(X,Z).
antecesor_de(X,Y):-progenitor(X,Y),persona(X),persona(Y).
antecesor_de(X,Y):-progenitor(X,Z),antecesor_de(Z,Y).
tio(X,Y):-progenitor(Z,Y),hermanos(Z,X).
primo(X,Y):-progenitor(Z,Y), tio(Z,X).
sobrino(X,Y):-progenitor(Z,Y),hermanos(Z,X).
