#!/bin/bash
URL_ARRAY=(
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52876&y=14291&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52877&y=14291&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52876&y=14290&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52877&y=14290&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52876&y=14292&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52875&y=14291&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52877&y=14292&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52878&y=14291&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52876&y=14289&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52875&y=14290&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52877&y=14289&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52878&y=14290&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52874&y=14291&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52876&y=14293&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52875&y=14292&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52878&y=14292&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52879&y=14291&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52877&y=14293&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52874&y=14290&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52876&y=14288&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52875&y=14289&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52877&y=14288&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52878&y=14289&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52879&y=14290&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52874&y=14292&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52875&y=14293&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52879&y=14292&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52878&y=14293&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52874&y=14289&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52875&y=14288&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52878&y=14288&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52879&y=14289&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52874&y=14293&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52879&y=14293&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52874&y=14288&z=18'
'http://online4.map.bdimg.com/onlinelabel/?qt=tile&x=52879&y=14288&z=18'
)
 
NAME_ARRAY=(
'18_52876_14291.jpg'
'18_52877_14291.jpg'
'18_52876_14290.jpg'
'18_52877_14290.jpg'
'18_52876_14292.jpg'
'18_52875_14291.jpg'
'18_52877_14292.jpg'
'18_52878_14291.jpg'
'18_52876_14289.jpg'
'18_52875_14290.jpg'
'18_52877_14289.jpg'
'18_52878_14290.jpg'
'18_52874_14291.jpg'
'18_52876_14293.jpg'
'18_52875_14292.jpg'
'18_52878_14292.jpg'
'18_52879_14291.jpg'
'18_52877_14293.jpg'
'18_52874_14290.jpg'
'18_52876_14288.jpg'
'18_52875_14289.jpg'
'18_52877_14288.jpg'
'18_52878_14289.jpg'
'18_52879_14290.jpg'
'18_52874_14292.jpg'
'18_52875_14293.jpg'
'18_52879_14292.jpg'
'18_52878_14293.jpg'
'18_52874_14289.jpg'
'18_52875_14288.jpg'
'18_52878_14288.jpg'
'18_52879_14289.jpg'
'18_52874_14293.jpg'
'18_52879_14293.jpg'
'18_52874_14288.jpg'
'18_52879_14288.jpg'
)
 
ELEMENTS=${#URL_ARRAY[@]}
 
for (( i=0;i<ELEMENTS;i++)); do
 echo ${URL_ARRAY[${i}]}
 echo "saved as ${NAME_ARRAY[${i}]}"
 curl ${URL_ARRAY[${i}]} -o images/${NAME_ARRAY[${i}]}
 sleep 1
 
done
