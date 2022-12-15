output.pl: script.awk marge_simpson.csv
	awk -f script.awk marge_simpson.csv > $@ 2>/dev/null
	cat $@	
clean:
	rm output.pl Digraph.gv* 2>/dev/null &>&2
