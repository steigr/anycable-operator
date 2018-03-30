# Anycable Operator

This repository contains the ClusterServiceVersion-V1 and CustomResourceDefinition to build and deploy the Anycable Operator. Check out `test/`-Folder for some CustomResource examples.

## Getting Started

Run `./generate-and-install-anycable.sh $NAMESPACE $IMAGE` to build and push the operator image and create the cluster service version.

## Usage

The CustomResource manifest. Must suffice the following minimal form:

```yaml
apiVersion: bus.stei.gr/v1alpha1
kind: Anycable
metadata:
  name: anycable
  namespace: default
spec:
  server:
    image:
      name: docker.io/steigr/anycable
  websocket:
    ingress:
      hostname: anycable.sandbox
```

This manifest result in:
* 1 Deployment of `anycable-go`.
* 1 Deployment of your individual rails-application. The image will be started with `bin/anycable`.
* 1 CustomResource to request a Redis service.
* 1 Ingress-Rule
* 2 Services, one for the inbound websocket connections and one for grpc communication.
* 2 ConfigMaps

For all possible values check out [the default values.yaml](/chart/values.yaml). 

## TODO

* Allow to pass ConfigMap or environment variables for the rails (grpc) service.
* Allow individual Ingress types.
* Check if one ClusterService can rule all namespaces.