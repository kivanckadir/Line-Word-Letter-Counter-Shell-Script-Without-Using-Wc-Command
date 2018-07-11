if [ $# -eq 2 ];
then
	if [ -f $1 ]; 
	then
		if [ -s $1 ];
		then
			case $2 in
				-h) 	
					a=`sed 's/[^a-zA-Z]//g' $1 | awk '{sum=sum+length} END {print sum}'`
					echo $1 "contains" $a "letters."
					echo "Note: Spaces and special characters were not counted.";;


				-k) 	
					a=`awk '{sum=sum+NF} END {print sum}' $1`
					echo $1 "contains" $a "words.";;


				-l)	
					a=`awk '{for(i=1;i<=NR;i++) k=i} END {print k}' $1`
					echo $1 "contains" $a "lines."
					echo "Note: Blank lines (if any) were also counted.";;


				*) echo "Invalid option entry!";;
			esac
		else echo $1 "is empty file!"
		fi
	else echo $1 "was not found!"
	fi
elif [ $# -gt 2 ];
then
	echo "Too many parameters!"

else	echo "Missing parameters!"
fi
