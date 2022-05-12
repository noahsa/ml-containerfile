# ML Containerfile


## Steps

1. Login to OpenShift. Get command from `Copy login command` in the OpenShift web console.

    ```bash
    oc login --token=token --server=cluster_url
    ```

2. Create ML container

    ```bash
    oc new-build \
    https://github.com/noahsa/ml-containerfile.git#dev \
    --name=ml-image \
    --strategy=docker
    ```
