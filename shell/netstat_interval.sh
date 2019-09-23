#!/bin/bash

function date_sub_with_date(){
    spec_date=$1
    days=$[$2]
    os=$(uname -s)
    if [[ "$os" == "Linux" ]]; then
        echo $(date -d -${days}day"${spec_date}" +'%Y-%m-%d %H:%M:%S')
    elif [[ "$os" == "Darwin" ]]; then
        if [[ "" == "${spec_date}" ]]; then
            echo "$(date -v-${days}d +'%Y-%m-%d %H:%M:%S')"
        else
            echo "$(date -v-${days}d -j -f %Y-%m-%d ${spec_date} +'%Y-%m-%d %H:%M:%S')"
        fi
    else
        echo "unknown OS"
        exit 1
    fi
}

while true
do
now=$(date_sub_with_date "" 0)
ret=$(netstat -n| awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}')
echo ${now}" tcp连接信息: "${ret}
sleep 1
done

