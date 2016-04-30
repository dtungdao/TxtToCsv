#/usr/bin/bash

# validate user input
if [ $# -lt 2 ]
then
    echo 'USAGE: ./TxtToCsv.sh input_file.txt output_file.csv'
    exit
fi

txt_file=$1
csv_file=$2

csv_header='DF Study, Time Stamp ,Work FlowLevel, Data Records Pending, Data Records Lost, Data Records Incomplete, Data Records Page Final, Total, Queries Pending, Queries Unresolved, Queries Resolved, Queries Total'
DFStudy_indicator='#Database'
date_indicator='#Date'
level0_indicator='0. Level'
level1_indicator='1. Level'
level2_indicator='2. Level'
level3_indicator='3. Level'
level4_indicator='4. Level'
level5_indicator='5. Level'
level6_indicator='6. Level'
level7_indicator='7. Level'
last1_indicator='#Records awaiting validation'
last2_indicator='#Records being validated'

while read -r line
do
    if [[ $line =~ .*$DFStudy_indicator.*  ]]
    then
        echo $csv_header >> $csv_file
        echo -n "${line//[^0-9]/}," >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$date_indicator.*  ]]
    then
        echo -n "${line: -25}," >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level0_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo "Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level1_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "level1_indicator"
    elif [[ $line =~ .*$level2_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level3_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level4_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level5_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level6_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$level7_indicator.*  ]]
    then
        IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 <<< $line
        echo ",,Level $col3, $col4, $col5, $col6, $col7, $col8" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$last1_indicator.*  ]]
    then
        echo ",,Records awaiting validation, ${line//[^0-9]/}" >> $csv_file
        echo "$line"
    elif [[ $line =~ .*$last2_indicator.*  ]]
    then
        echo ",,Records being validated, ${line//[^0-9]/}" >> $csv_file
        echo "$line"
    fi
done < $txt_file

