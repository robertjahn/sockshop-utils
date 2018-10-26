#!/bin/bash

showUsage()
{
  echo "usage: ./create_namespace.sh [namespace to add]"
}

$NAMESPACE=$1
if [ -z "$1" ]; then
    echo -e "Namespace is required argument\n"
    showUsage
    exit 1
fi

if [[ $(kubectl get namespace | grep -x $NAMESPACE | wc -l) -eq 0 ]]; then
  echo "Create namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
fi

