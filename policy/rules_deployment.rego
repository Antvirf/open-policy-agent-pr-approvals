package main

import data.kubernetes

# Based on examples from
# https://www.conftest.dev/examples/

name := input.metadata.name

# Ensure that deployment has an 'owner' label
violation[{"msg": msg, "details": {}}] {
	kubernetes.is_deployment
	not input.spec.template.metadata.labels.owner
	msg := sprintf(
		"Deployment %v does not have an 'owner' label",
		[name],
	)
}
