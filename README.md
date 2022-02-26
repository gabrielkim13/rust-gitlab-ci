# Rust GitLab CI

Local GitLab instance, with a single runner, and CI setup for Rust projects including 2 pipelines:

- **Merge request:** [Clippy](https://rust-lang.github.io/rust-clippy/master/) linting and automated tests
- **Release:** Automatic release generation and upload of the cross-compiled binary

## Pre-requisites

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
  - [Docker Compose](https://docs.docker.com/compose/install/)
- [Rust](https://www.rust-lang.org/)

## Instructions

### Setting up a local GitLab instance

Start a GitLab and a single runner instance by running the `docker-compose.yaml` file:

```bash
docker-compose up -d
```

When the GitLab container finishes loading, you may login at http://localhost:8929. You will be asked to create a new 
password for the `root` user, which is the default **admin** user.

After setting everything up, go to http://localhost:8929/admin/runners for the instructions on how to register new 
runners. Overall, take note of the **registration token**, mentioned on this page.

```bash
# Access the runner instance
docker exec -it gitlab_runner1 sh

# Register it by running
gitlab-runner register \
  --non-interactive \
  --url "http://web:8929/"
  --registration-token "REGISTRATION TOKEN GOES HERE!" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "runner1"
```

Furthermore, it is still necessary to override the GitLab URL, since the runner won't be able to reach it via localhost.
This can be done by adding the following configuration to `/etc/gitlab-runner/config.toml`:

```toml
[[runners]]
  clone_url = "http://web:8929/"
  [runners.docker]
    network_mode = "gitlab_default"
```
