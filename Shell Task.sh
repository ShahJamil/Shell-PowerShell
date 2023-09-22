file=$1
three=3
while [ -z "$file" ]
do	
echo "Enter a parameter!"
read file
done


BarmanNames=`grep -w "barman" $file | cut -d ',' -f 1`

BarmanCount=`grep -c -w  "barman" $file`

#find names of workers working as barman

echo "The names of people working as a barman:"

if test $BarmanCount == 0
then
echo "NONE"
else
	echo $BarmanNames
fi
#find names of people working 3 jobs and above
echo "The names of people working three jobs and above:"


for i in `cat $file`
do
line=`echo $i | cut -d ',' -f 2- | awk -F ',' '{print NF}'`
name=`echo $i | cut -d ',' -f 1`
if test $line -ge $three
then
	echo $name
fi
done

jobCountOverall=`cut -d ',' -f 2- $file | awk -F ',' '{print NF}' | sort -nr | head -1`

if test $jobCountOverall -lt $three	
then
	echo "NONE"
fi

#third task  of the code! 

echo "Please give a job name"
read JobName

while [ -z "$JobName" ]
do
echo "Please give a job name!"
read JobName
done

FindJobCount=`grep -c -w  "$JobName" $file`
echo "Number of people working in $JobName position is: $FindJobCount"
