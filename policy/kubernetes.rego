package kubernetes

# Based on examples from
# https://www.conftest.dev/examples/

is_service {
	input.kind = "Service"
}

is_deployment {
	input.kind = "Deployment"
}
