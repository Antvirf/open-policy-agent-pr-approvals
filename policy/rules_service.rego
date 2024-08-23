package main

import data.kubernetes

# Based on examples from
# https://www.conftest.dev/examples/

name := input.metadata.name

# Ensure that service is not of type Load Balancer
violation[{"msg": msg, "details": {}}] {
	kubernetes.is_service
	input.spec.type == "LoadBalancer"
	msg := sprintf("Service %v is of type LoadBalancer", [name])
}
