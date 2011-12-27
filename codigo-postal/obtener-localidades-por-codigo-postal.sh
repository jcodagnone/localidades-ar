
for i in A B C D E F G H J K L M N P Q R S T U V W X Y Z;
do
  curl -s \
http://www.correoargentino.com.ar/consultas/cpa/obtener_localidades/$i"?localidad=" | 
  grep option|
  sed 's/&Ntilde;/Ñ/g'|
  sed 's/&&Uuml;/Ü/g'|
  cut -d '>' -f2 |
  cut -d'<' -f1 |
  sed s/')'//g|
  sed 's/(/	/g'|
  awk 'BEGIN{FS="\t"; OFS="\t"} {print $2,"'$i'",$1}' > correo/$i.txt
done

cat *.txt|sort -un > todos.csv
