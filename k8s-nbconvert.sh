#!/bin/bash -ex

NOTEBOOK_DIR=$(dirname $1)
pushd $NOTEBOOK_DIR
NOTEBOOK=$(basename $1)
: ${NS:=snippets-admin}
POD=$(kubectl get pods -n $NS | awk '/jupyter/{print $1}')
kubectl cp -n $NS "$NOTEBOOK" $POD:.
kubectl exec -n $NS $POD -- jupyter nbconvert --to notebook --execute --inplace "$NOTEBOOK"
pushd $(mktemp -d)
kubectl cp -n $NS $POD:"$NOTEBOOK" .
if [[ "$2" =~ "commit" ]]; then
    git clone --depth=1 -b ${BRANCH:=master} ${REPO:=github.com:mozmeao/snippets-private-data} snippets-private-data
    pushd snippets-private-data
    if [[ $2 =~ month ]]; then
        YM=$(date --date="1 month ago" +%Y/%m)
        mkdir -p $YM
        mv ../"$NOTEBOOK" $YM
        NOTEBOOK_PATH="$YM/$NOTEBOOK"
    elif [[ $2 =~ quarter ]]; then
        MONTH=$(date --date="1 month ago" +%m)
        if (( $MONTH <= 3 )); then
            Q=Q1
        elif (( $MONTH <= 6 )); then
            Q=Q2
        elif (( $MONTH <= 9 )); then
            Q=Q3
        elif (($MONTH <= 12 )); then
            Q=Q4
        fi
        YQ=$(date --date="1 month ago" +%Y)/$Q
        mkdir -p $YQ
        mv ../"$NOTEBOOK" $YQ
        NOTEBOOK_PATH="$YQ/$NOTEBOOK"
    else
        echo invalid commit arg: use commit-month or commit-quarter
        exit 1
    fi
    git add "$NOTEBOOK_PATH"
    git commit -m "$NOTEBOOK_PATH"
    git push
fi
