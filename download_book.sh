#!/bin/bash
USERNAME=$1
PASSWORD=$2
BOOK_ID=$3
PAGES=$4
cookie=`curl -I http://www.panjabdigilib.org/webuser/searches/mainpage.jsp | grep -o -E "=(.+);"`
cookie=${cookie:1:$((${#cookie}-2))}
echo "Aunthenticating cookie = $cookie"
# echo "curl --cookie \"JSESSIONID=$cookie\" --data \"webusername=$USERNAME&webpassword=$PASSWORD\" http://www.panjabdigilib.org/webuser/wls/index.jsp?curi=searches/mainpage.jsp"
curl -v --cookie "JSESSIONID=$cookie" --data "webusername=$USERNAME&webpassword=$PASSWORD" http://www.panjabdigilib.org/webuser/wls/index.jsp?curi=searches/mainpage.jsp
for page in `seq 1 $PAGES`; do
    echo "Downloading page $page"
    #echo "curl --cookie \"JSESSIONID=$cookie\" http://www.panjabdigilib.org/images?ID=$3&page=$page&CategoryID=1&pagetype=null&Searched=W3GX > $page"
    `curl --cookie "JSESSIONID=$cookie" http://www.panjabdigilib.org/images?ID=$BOOK_ID\&page=$page\&CategoryID=1\&pagetype=null\&Searched=W3GX > $page`
done

