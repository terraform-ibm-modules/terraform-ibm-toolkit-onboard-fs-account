#!/usr/bin/env bash

REGION="$1"
ACTION="$2"

if [[ -z "${REGION}" ]]; then
  echo "REGION must be provided as the the first argument"
  exit 1
fi

if [[ -z "${ACTION}" ]]; then
  echo "ACTION must be provided as the second argument (enable or disable)"
fi

if [[ -z "${IBMCLOUD_API_KEY}" ]]; then
  echo "IBMCLOUD_API_KEY env variable must be set"
  exit 1
fi

if [[ -n "${BIN_DIR}" ]]; then
  export PATH="${BIN_DIR}:${PATH}"
fi

ibmcloud login --apikey "${IBMCLOUD_API_KEY}" -r "${REGION}"

echo "ap-north,ap-south,ca-tor,eu-central,global,jp-osa,uk-south,us-south" | tr "," "\n" | \
  while read cr_region;
do
  ibmcloud cr region-set "${cr_region}"
  echo "Updating platform-metrics for ${cr_region}: ${ACTION}"
  ibmcloud cr platform-metrics --${ACTION}
done
