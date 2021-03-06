#!/bin/bash

showUsage()
{
  echo "usage: ./create_namespace.sh [namespace to add]"
}

if [ -z "$1" ]; then
    echo -e "Namespace is required argument\n"
    showUsage
    exit 1
fi
NAMESPACE=$1

if ! kubectl get namespace $NAMESPACE ; then
  echo "Create namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
fi

