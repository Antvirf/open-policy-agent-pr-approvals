# Open Policy Agent-based PR Approvals

See the GitHub Actions workflow file [here](/.github/workflows/opa-pr-auto-approval.yaml). What this workflow does:

1. On PR, figure out which files were added or changed
2. Assemble the list of files, and feed them through Open Policy Agent [conftest](https://www.conftest.dev/) utility
3. Post results to the PR

While the first and last steps are quite specific to GitHub, step #2 is orchestrated with bash scripts and is portable across environments. The only requirement is `Docker`.

## Test a file in this repo against policy

The below examples use Docker to avoid needing to install anything persistent locally:

```bash
# services
docker run --rm -v $(pwd):/project openpolicyagent/conftest test --no-fail --no-color gitops-deployments/service.yaml

# deployments
docker run --rm -v $(pwd):/project openpolicyagent/conftest test --no-fail --no-color gitops-deployments/deployment.yaml

# run both, the same way as the GitHub Actions script does
echo "gitops-deployments/deployment.yaml\ngitops-deployments/service.yaml" | xargs docker run --rm -v $(pwd):/project openpolicyagent/conftest test --no-fail --no-color
```
