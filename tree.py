#!/usr/bin/pyhon3
from graphviz import Digraph
import signal,sys
import time

def def_handler(sig,frame):
    print("\n\n[!] Saliendo..")
    sys.exit(1)


signal.signal(signal.SIGINT,def_handler)
if __name__ == "__main__":
    f = Digraph(graph_attr={ "splines":"ortho","concentrate":"true","overlap":"false"})
    f.attr(rankdir='LB',size='12,11')
    f.attr('node',shape='box')
     
    file = open("./marge_simpson.csv","r+")
    lines = file.readlines()
    lines = lines[1:]
    # se agregan los nodos al arbol
    for index,line in enumerate(lines):
        #print(line.split(",")[0])
        f.node(line.split(",")[0],line.split(",")[0])
    # luego se itera y se busca el campo de padre y madre para poder hacer el arbol
    for index,line in enumerate(lines):
        #print(line.split(",")[6])
        if(line.split(",")[6]):
         
            #print("es",line.split(",")[0] ," madre ",line.split(",")[6])
            f.edge(line.split(",")[6],line.split(",")[0])
        if (line.split(",")[7]):
            #print("es",line.split(",")[0] ," padre ",line.split(",")[7])
             
            f.edge(line.split(",")[7],line.split(",")[0])
        if (line.split(",")[8]):
            f.edge(line.split(",")[0],line.split(",")[8])
            #print("es",line.split(",")[0] ," pareja de ",line.split(",")[8])
    file.close()
    f.view()
    time.sleep(10)
