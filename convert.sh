total_pages=$2
size=$1
j=0
for i in $(seq -f "%03g" 1 $total_pages); do
   `mv $j.png $i.png` 
   j=$((j+1))
done

