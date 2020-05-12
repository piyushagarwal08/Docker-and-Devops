#!/bin/bash
count=1
while [ $count -le 10 ]
do
docker container run -d --name alpine$count alpine ping fb.com
((count++))
done

