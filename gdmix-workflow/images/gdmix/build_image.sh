#!/bin/sh

rsync -arvp ../../examples/movielens-100k/*single-node*.config .
rsync -arvp ../../../scripts/download_process_movieLens_data.py .

REGISTROY=linkedin
IMAGE_NAME=gdmix
VERSION_TAG=0.2
VERSIONED_IMAGE_NAME=${REGISTROY}/${IMAGE_NAME}:${VERSION_TAG}

echo "Building image ${VERSIONED_IMAGE_NAME}"
docker build --squash -t ${VERSIONED_IMAGE_NAME} .

# TODO: uncomment to push to docker hub
# docker push ${VERSIONED_IMAGE_NAME}

rm -rf *.config *.py
