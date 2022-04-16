#!/bin/bash
Temp=/tmp/pdftxtmp.txt
Dest=/root/Scan
Pdf=/var/lib/paperless/media/documents/archive/*.pdf
NOW=$(date "+%d%m%Y_%H.%M")
Log=/var/log/pdfrename_$NOW.log
if ls $Pdf 2>/dev/null 1>&2
then for pdf in $Pdf; do
	pdftotext -layout "$pdf" $Temp
	Nome=$(grep -i "nominativo" $Temp | awk '{out=$3; for (i=4;i<=NF;i++){out=out" "$i}  print out}')
	PC=$(grep -i "computer" $Temp | awk '{print $3}')
	Cespite=$(grep  "Cespite" $Temp | awk '{print $3}')
	if [[ "$Cespite" = "" ]]
	then Cespite=NO_CESPITE
	fi
	if [[ "$PC" = "" ]]
	then PC=NO_PCNAME
	fi
	if [[ "$Nome" = "" ]]
	then Nome=NO_NAME
	fi
	FileName="$Dest/$Cespite-$PC ($Nome).pdf"
	mv --backup=t -v -T "$pdf" "$FileName" >> $Log
done
else echo "NO NEW PDF FILES FOUND IN --> $Pdf" >> $Log
fi
